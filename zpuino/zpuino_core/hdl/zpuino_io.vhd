--
--  IO dispatcher for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_io is
  generic (
    spp_cap_in:  in std_logic_vector(zpuino_gpio_count-1 downto 0); -- SPP capable pin for INPUT
    spp_cap_out:  in std_logic_vector(zpuino_gpio_count-1 downto 0) -- SPP capable pin for OUTPUT
  );
  port (
    clk:      in std_logic;
	 	areset:   in std_logic;
    read:     out std_logic_vector(wordSize-1 downto 0);
    write:    in std_logic_vector(wordSize-1 downto 0);
    address:  in std_logic_vector(maxAddrBitIncIO downto 0);
    we:       in std_logic;
    re:       in std_logic;
    busy:     out std_logic;
    interrupt:out std_logic;
    intready: in std_logic;

    -- GPIO
    gpio_o:         out std_logic_vector(zpuino_gpio_count-1 downto 0);
    gpio_t:         out std_logic_vector(zpuino_gpio_count-1 downto 0);
    gpio_i:         in std_logic_vector(zpuino_gpio_count-1 downto 0);

    tx: out std_logic;
    rx: in std_logic
  );
end entity zpuino_io;

architecture behave of zpuino_io is

  signal spi_enabled:  std_logic;

  signal spi2_enabled:  std_logic;
  signal spi2_mosi:  std_logic;
  signal spi2_miso:  std_logic;
  signal spi2_sck:  std_logic;

  signal uart_enabled:  std_logic;

  -- SPP signal is one more than GPIO count
  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);

  --signal gpio_spp_en: std_logic_vector(zpuino_gpio_count-1 downto 1);

  signal timers_interrupt:  std_logic_vector(1 downto 0);
  signal timers_spp_data: std_logic_vector(1 downto 0);
  signal timers_spp_en: std_logic_vector(1 downto 0);
  signal timers_comp: std_logic;

  signal ivecs: std_logic_vector(17 downto 0);

  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);

  -- For busy-implementation
  signal addr_save_q: std_logic_vector(maxAddrBitIncIO downto 0);
  signal write_save_q: std_logic_vector(wordSize-1 downto 0);

  signal io_address: std_logic_vector(maxAddrBitIncIO downto 0);
  signal io_write: std_logic_vector(wordSize-1 downto 0);
  signal io_we: std_logic;
  signal io_re: std_logic;
  signal io_device_busy: std_logic;

  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck: std_logic;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic;

  signal adc_mosi:  std_logic;
  signal adc_miso:  std_logic;
  signal adc_sck:   std_logic;
  signal adc_seln:  std_logic;
  signal adc_enabled: std_logic;


  type slot_std_logic_type is array(0 to 15) of std_logic;
  subtype cpuword_type     is std_logic_vector(31 downto 0);
  type slot_cpuword_type   is array(0 to 15) of cpuword_type;
  subtype address_type     is std_logic_vector(10 downto 2);
  type slot_address_type   is array(0 to 15) of address_type;

  signal slot_re:       slot_std_logic_type;
  signal slot_we:       slot_std_logic_type;

  signal slot_read:     slot_cpuword_type;
  signal slot_write:    slot_cpuword_type;
  signal slot_address:  slot_address_type;

  signal slot_busy:     slot_std_logic_type;
  signal slot_interrupt:slot_std_logic_type;

  signal audio_dac: std_logic;
  signal ym2149_audio1: std_logic_vector(7 downto 0);
  signal ym2149_audio2: std_logic_vector(7 downto 0);
  signal pokey_audio1: std_logic_vector(7 downto 0);
  signal pokey_audio2: std_logic_vector(7 downto 0);
  signal sn76489_audio: std_logic_vector(7 downto 0);

  -- Audio mixer
	component zpuino_audiomixer is
	port (
		clk:      	in std_logic;
		rst:      	in std_logic;
		ena:		in std_logic;
		
		data_in1:  	in std_logic_vector(7 downto 0);
		data_in2:  	in std_logic_vector(7 downto 0);
		data_in3:  	in std_logic_vector(7 downto 0);

		audio_out: 	out std_logic
	);
	end component zpuino_audiomixer;


begin
  
  -- Busy generator

  process(slot_busy,io_device_busy)
  begin
    io_device_busy <= '0';
    for i in 0 to 15 loop
      if slot_busy(i) = '1' then
        io_device_busy<='1';
      end if;
    end loop;
  end process;

  iobusy: if zpuino_iobusyinput=true generate
    process(clk)
    begin
      if rising_edge(clk) then
        if we='1' or re='1' then
          addr_save_q <= address;
        end if;
        if we='1' then
          write_save_q <= write;
        end if;
      end if;
    end process;

    io_address <= addr_save_q;
    io_write <= write_save_q;

    -- Generate busy signal, and rd/wr flags

    process(io_device_busy, re, we)
    begin
      if (re='1' or we='1') then
        busy <= '1';
      elsif io_device_busy='1' then
        busy <= '1';
      else
        busy <= '0';
      end if;
    end process;

    process(clk)
    begin
      if rising_edge(clk) then
        if areset='1' then
          io_re <= '0';
          io_we <= '0';
        else
          -- If no device is busy, propagate request
          if io_device_busy='0' then
            io_re <= re;
            io_we <= we;
          end if;
        end if;
      end if;
    end process;

  end generate;

  noiobusy: if zpuino_iobusyinput=false generate

    io_address <= address;
    io_write <= write;
    io_re <= re;
    io_we <= we;

    busy <= io_device_busy;
  end generate;

  -- Interrupt vectors

  process(slot_interrupt)
  begin
    for i in 0 to 15 loop
      ivecs(i) <= slot_interrupt(i);
    end loop;
  end process;

  -- Write and address signals, shared by all slots
  process(io_write,io_address)
  begin
    for i in 0 to 15 loop
      slot_write(i) <= io_write;
      slot_address(i) <= io_address(10 downto 2);
    end loop;
  end process;

  process(io_address,slot_read)
    variable slotNumber: integer range 0 to 15;
  begin

    slotNumber := to_integer(unsigned(io_address(14 downto 11)));
    read <= slot_read(slotNumber);

  end process;

  -- Enable signals

  process(io_address,io_re,io_we)
    variable slotNumber: integer range 0 to 15;
  begin

    slotNumber := to_integer(unsigned(io_address(14 downto 11)));

    for i in 0 to 15 loop
      if i = slotNumber then
        slot_re(i) <= io_re;
        slot_we(i) <= io_we;
      else
        slot_re(i) <= '0';
        slot_we(i) <= '0';
      end if;
    end loop;

  end process;

  --
  -- IO SLOT 0
  --

  slot0: zpuino_spi
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(0),
    write     => slot_write(0),
    address   => slot_address(0),
    we        => slot_we(0),
    re        => slot_re(0),
    busy      => slot_busy(0),
    interrupt => slot_interrupt(0),

    mosi      => spi_pf_mosi,
    miso      => spi_pf_miso,
    sck       => spi_pf_sck,
    enabled   => spi_enabled
  );

  --
  -- IO SLOT 1
  --

  uart_inst: zpuino_uart
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(1),
    write     => slot_write(1),
    address   => slot_address(1),
    we        => slot_we(1),
    re        => slot_re(1),
    busy      => slot_busy(1),
    interrupt => slot_interrupt(1),

    enabled   => uart_enabled,
    tx        => uart_tx,
    rx        => uart_rx
  );

  --
  -- IO SLOT 2
  --

  gpio_inst: zpuino_gpio
  generic map (
    gpio_count => zpuino_gpio_count
  )
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(2),
    write     => slot_write(2),
    address   => slot_address(2),
    we        => slot_we(2),
    re        => slot_re(2),
    busy      => slot_busy(2),
    interrupt => slot_interrupt(2),

    spp_data  => gpio_spp_data,
    spp_read  => gpio_spp_read,

    gpio_i      => gpio_i,
    gpio_t      => gpio_t,
    gpio_o      => gpio_o,
    spp_cap_in   => spp_cap_in,
    spp_cap_out  => spp_cap_out
  );

  --
  -- IO SLOT 3
  --

  timers_inst: zpuino_timers
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(3),
    write     => slot_write(3),
    address   => slot_address(3),
    we        => slot_we(3),
    re        => slot_re(3),
    busy      => slot_busy(3),
    interrupt0 => slot_interrupt(3), -- We use two interrupt lines
    interrupt1 => slot_interrupt(4), -- so we borrow intr line from slot 4
    spp_data  => timers_spp_data,
    spp_en    => timers_spp_en,
    comp      => timers_comp
  );

  --
  -- IO SLOT 4
  --

  intr_inst: zpuino_intr
  generic map (
    INTERRUPT_LINES =>  18
  )
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(4),
    write     => slot_write(4),
    address   => slot_address(4),
    we        => slot_we(4),
    re        => slot_re(4),
    busy      => slot_busy(4),
    interrupt => interrupt, -- Interrupt signal to core

    poppc_inst=> intready,
    intr_in     => ivecs,
    intr_cfglvl => "110000000000000000"
  );

  --
  -- IO SLOT 5
  --

  sigmadelta_inst: zpuino_sigmadelta
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(5),
    write     => slot_write(5),
    address   => slot_address(5),
    we        => slot_we(5),
    re        => slot_re(5),
    busy      => slot_busy(5),
    interrupt => slot_interrupt(5),

    spp_data  => sigmadelta_spp_data,
    spp_en    => sigmadelta_spp_en,
    sync_in   => timers_comp
  );

  --
  -- IO SLOT 6
  --

  slot1: zpuino_spi
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(6),
    write     => slot_write(6),
    address   => slot_address(6),
    we        => slot_we(6),
    re        => slot_re(6),
    busy      => slot_busy(6),
    interrupt => slot_interrupt(6),

    mosi      => spi2_mosi,
    miso      => spi2_miso,
    sck       => spi2_sck,
    enabled   => spi2_enabled
  );



  --
  -- IO SLOT 7
  --

  crc16_inst: zpuino_crc16
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(7),
    write     => slot_write(7),
    address   => slot_address(7),
    we        => slot_we(7),
    re        => slot_re(7),
    busy      => slot_busy(7),
    interrupt => slot_interrupt(7)
  );

  --
  -- IO SLOT 8 (optional)
  --

  adcgen: if zpuino_adc_enabled generate

  adc_inst:zpuino_adc
  port map (
    clk       => clk,
	 	areset    => areset,
    read      => slot_read(8),
    write     => slot_write(8),
    address   => slot_address(8),
    we        => slot_we(8),
    re        => slot_re(8),
    busy      => slot_busy(8),
    interrupt => slot_interrupt(8),

    sample    => timers_comp,
    mosi      => adc_mosi,
    miso      => adc_miso,
    sck       => adc_sck,
    seln      => adc_seln,
    enabled   => adc_enabled
  );
  end generate;

  --
  -- IO SLOT 9
  --

  slot9: zpuino_empty_device
  port map (
    clk       => clk,
	 	rst       => areset,
    read      => slot_read(9),
    write     => slot_write(9),
    address   => slot_address(9),
    we        => slot_we(9),
    re        => slot_re(9),
    busy      => slot_busy(9),
    interrupt => slot_interrupt(9)
  );

  --
  -- IO SLOT 10
  --

  slot10:  YM2149 
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(10),
    write     => slot_write(10),
    address   => slot_address(10),
    we        => slot_we(10),
    re        => slot_re(10),
    busy      => slot_busy(10),
    interrupt => slot_interrupt(10),
    data_out  => ym2149_audio1
  );

  --
  -- IO SLOT 11
  --

  slot11: YM2149
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(11),
    write     => slot_write(11),
    address   => slot_address(11),
    we        => slot_we(11),
    re        => slot_re(11),
    busy      => slot_busy(11),
    interrupt => slot_interrupt(11),
    data_out => ym2149_audio2
  );

  --
  -- IO SLOT 12
  --

  slot12: POKEY
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(12),
    write     => slot_write(12),
    address   => slot_address(12),
    we        => slot_we(12),
    re        => slot_re(12),
    busy      => slot_busy(12),
    interrupt => slot_interrupt(12),
    data_out  => pokey_audio1
  );

  --
  -- IO SLOT 13
  --

  slot13: POKEY
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(13),
    write     => slot_write(13),
    address   => slot_address(13),
    we        => slot_we(13),
    re        => slot_re(13),
    busy      => slot_busy(13),
    interrupt => slot_interrupt(13),
    data_out  => pokey_audio2
  );

  --
  -- IO SLOT 14
  --

  slot14: zpuino_SN76489
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(14),
    write     => slot_write(14),
    address   => slot_address(14),
    we        => slot_we(14),
    re        => slot_re(14),
    busy      => slot_busy(14),
    interrupt => slot_interrupt(14),
    data_out  => sn76489_audio
  );

  --
  -- IO SLOT 15
  --

  slot15: zpuino_empty_device
  port map (
    clk       => clk,
	rst       => areset,
    read      => slot_read(15),
    write     => slot_write(15),
    address   => slot_address(15),
    we        => slot_we(15),
    re        => slot_re(15),
    busy      => slot_busy(15),
    interrupt => slot_interrupt(15)
  );
  
  
  --
  -- Shared component accross devices : audio mixer
  --
  audiomixer : zpuino_audiomixer
  port map (
    clk       	=> clk,
	rst       	=> areset,
    ena		  	=> '1',
    
    data_in1	=> ym2149_audio1,
    data_in2  	=> sn76489_audio,
    data_in3  	=> pokey_audio1,
    
    audio_out 	=> audio_dac
  );
  
  uart_rx <= rx;
  tx <= uart_tx;

  process(spi_enabled,spi2_enabled,spi_enabled,
          uart_enabled,sigmadelta_spp_en, uart_tx,
          gpio_spp_read, spi_pf_mosi, spi_pf_sck,
          sigmadelta_spp_data,timers_spp_data,
          spi2_mosi,spi2_sck,timers_spp_en,audio_dac)
  begin

    gpio_spp_data <= (others => DontCareValue);

    spi_pf_miso <= gpio_spp_read(0);            -- PPS1 : SPI MISO
    gpio_spp_data(1) <= spi_pf_mosi;            -- PPS2 : SPI MOSI
    gpio_spp_data(2) <= spi_pf_sck;             -- PPS3 : SPI SCK
    gpio_spp_data(3) <= sigmadelta_spp_data(0); -- PPS4 : SIGMADELTA DATA
    gpio_spp_data(4) <= timers_spp_data(0);     -- PPS5 : TIMER0
    gpio_spp_data(5) <= timers_spp_data(1);     -- PPS6 : TIMER1
    spi2_miso <= gpio_spp_read(6);              -- PPS7 : USPI MISO
    gpio_spp_data(7) <= spi2_mosi;              -- PPS8 : USPI MOSI
    gpio_spp_data(8) <= spi2_sck;               -- PPS9: USPI SCK
    if zpuino_adc_enabled then
      gpio_spp_data(9) <= adc_sck;           -- PPS10: ADC SCK
      adc_miso <= gpio_spp_read(10);          -- PPS11 : ADC MISO
      gpio_spp_data(11) <= adc_mosi;          -- PPS12 : ADC MOSI
      gpio_spp_data(12) <= adc_seln;          -- PPS13 : ADC SELN
    end if;
    gpio_spp_data(13) <= sigmadelta_spp_data(1); -- PPS14 : SIGMADELTA1 DATA
    gpio_spp_data(14) <= audio_dac; -- PPS14 : SIGMADELTA1 DATA
    
    -- External interrupt lines
    ivecs(16) <= gpio_spp_read(1);
    ivecs(17) <= gpio_spp_read(2);

  end process; 

end behave;
