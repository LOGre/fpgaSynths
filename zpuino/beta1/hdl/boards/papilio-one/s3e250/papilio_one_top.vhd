--
--  ZPUINO implementation on Gadget Factory 'Papilio One' Board
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.pad.all;

library unisim;
use unisim.vcomponents.all;

entity papilio_one_top is
  port (
    CLK:        in std_logic;
    --RST:        in std_logic; -- No reset on papilio

    SPI_SCK:    out std_logic;
    SPI_MISO:   in std_logic;
    SPI_MOSI:   out std_logic;
    SPI_CS:     inout std_logic; 

    GPIO:       inout std_logic_vector(47 downto 0);

    TXD:        out std_logic;
    RXD:        in std_logic

  );
end entity papilio_one_top;

architecture behave of papilio_one_top is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    rstout: out std_logic
  );
  end component clkgen;

  component zpuino_top is
  generic (
    spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0);
    spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0)
  );
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;

    gpio_o:   out std_logic_vector(zpuino_gpio_count-1 downto 0);
    gpio_t:   out std_logic_vector(zpuino_gpio_count-1 downto 0);
    gpio_i:   in std_logic_vector(zpuino_gpio_count-1 downto 0);

    tx:       out std_logic;
    rx:       in std_logic
  );
  end component zpuino_top;

  component zpuino_serialreset is
  generic (
    SYSTEM_CLOCK_MHZ: integer := 96
  );
  port (
    clk:      in std_logic;
    rx:       in std_logic;
    rstin:    in std_logic;
    rstout:   out std_logic
  );
  end component zpuino_serialreset;

  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal clkgen_rst:  std_logic;
  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal rx: std_logic;
  signal tx: std_logic;

  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "111111111111111111111111111111111111111111111111111000";
  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "111111111111111111111111111111111111111111111111101111";

begin

  rstgen: zpuino_serialreset
    generic map (
      SYSTEM_CLOCK_MHZ  => 96
    )
    port map (
      clk       => sysclk,
      rx        => rx,
      rstin     => clkgen_rst,
      rstout    => sysrst
    );
    --sysrst <= clkgen_rst;


  clkgen_inst: clkgen
  port map (
    clkin   => clk,
    rstin   => '0'  ,
    clkout  => sysclk,
    rstout  => clkgen_rst
  );

  bufgen: for i in 0 to 47 generate
    iop: IOPAD
      port map(
        I => gpio_o(i),
        O => gpio_i(i),
        T => gpio_t(i),
        C => sysclk,
        PAD => gpio(i)
      );
  end generate;

  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx, C => sysclk );
  ibufmiso: IPAD port map ( PAD => SPI_MISO,   O => gpio_i(49), C => sysclk );
  obuftx:   OPAD port map ( I => tx,   PAD => TXD );
  ospiclk:  OPAD port map ( I => gpio_o(51),   PAD => SPI_SCK );
  ospics:   OPAD port map ( I => gpio_o(52),   PAD => SPI_CS );
  ospimosi: OPAD port map ( I => gpio_o(53),   PAD => SPI_MOSI );

  zpuino:zpuino_top
  generic map (
    spp_cap_in => spp_cap_in,
    spp_cap_out => spp_cap_out
  )
  port map (
    clk           => sysclk,
	 	rst           => sysrst,

    gpio_i        => gpio_i,
    gpio_t        => gpio_t,
    gpio_o        => gpio_o,

    rx => rx,
    tx => tx
  );

end behave;
