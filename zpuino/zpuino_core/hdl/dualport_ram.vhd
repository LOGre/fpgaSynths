--
--  ZPUINO memory
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
use IEEE.std_logic_unsigned.all; 
library work;
use work.zpupkg.all;

entity dualport_ram is
  port (
    clk:              in std_logic;
    memAWriteEnable:  in std_logic;
    memAWriteMask:    in std_logic_vector(3 downto 0);
    memAAddr:         in std_logic_vector(maxAddrBit downto 2);
    memAWrite:        in std_logic_vector(31 downto 0);
    memARead:         out std_logic_vector(31 downto 0);
    memBWriteEnable:  in std_logic;
    memBWriteMask:    in std_logic_vector(3 downto 0);
    memBAddr:         in std_logic_vector(maxAddrBit downto 2);
    memBWrite:        in std_logic_vector(31 downto 0);
    memBRead:         out std_logic_vector(31 downto 0);
    memErr:           out std_logic
  );
end entity dualport_ram;

architecture behave of dualport_ram is

  component  prom_generic_dualport is
  port (
    clk:              in std_logic;
    memAWriteEnable:  in std_logic;
    memAWriteMask:    in std_logic_vector(3 downto 0);
    memAAddr:         in std_logic_vector(maxAddrBit downto 2);
    memAWrite:        in std_logic_vector(31 downto 0);
    memARead:         out std_logic_vector(31 downto 0);
    memBWriteEnable:  in std_logic;
    memBWriteMask:    in std_logic_vector(3 downto 0);
    memBAddr:         in std_logic_vector(maxAddrBit downto 2);
    memBWrite:        in std_logic_vector(31 downto 0);
    memBRead:         out std_logic_vector(31 downto 0)
    );
  end component prom_generic_dualport;

  signal memAWriteEnable_i:   std_logic;
  signal memBWriteEnable_i:   std_logic;
  constant nullAddr: std_logic_vector(maxAddrBit downto 12) := (others => '0');

  constant protectionEnabled: std_logic := '0';

begin
  -- Boot loader address: 000XXXXXXXXXX
  -- Disallow any writes to bootloader protected code (first 4096 bytes, 0x1000 hex (0x000 to 0xFFF)

  memAWriteEnable_i <= memAWriteEnable when ( memAAddr(maxAddrBit downto 12)/=nullAddr or protectionEnabled='0') else '0';
  memBWriteEnable_i <= memBWriteEnable when ( memBAddr(maxAddrBit downto 12)/=nullAddr or protectionEnabled='0') else '0';

  process(memAWriteEnable,memAAddr(maxAddrBit downto 12),memBWriteEnable,memBAddr(maxAddrBit downto 12))
  begin
    memErr <= '0';
    if memAWriteEnable='1' and memAAddr(maxAddrBit downto 12)="000" and protectionEnabled='1' then
      memErr<='1';
    end if;
    if memBWriteEnable='1' and memBAddr(maxAddrBit downto 12)="000" and protectionEnabled='1' then
      memErr<='1';
    end if;
  end process;

  -- Sanity checks for simulation
  process(clk)
  begin
    if rising_edge(clk) then
      if memAWriteEnable='1' and memAAddr(maxAddrBit downto 12)="000" and protectionEnabled='1' then
        report "Write to BOOTLOADER port A not allowed!!! " severity note;
      end if;
    end if;
  end process;

  -- Sanity checks for simulation
  process(clk)
  begin
    if rising_edge(clk) then
      if memBWriteEnable='1' and memBAddr(maxAddrBit downto 12)="000" and protectionEnabled='1' then
        report "Write to BOOTLOADER port B not allowed!!!" severity note;
      end if;
    end if;
  end process;

prom: prom_generic_dualport
  port map (
    clk               => clk,
    memAWriteEnable   => memAWriteEnable_i,
    memAAddr          => memAAddr,
    memAWrite         => memAWrite,
    memAWriteMask     => memAWriteMask,
    memARead          => memARead,
    memBWriteEnable   => memBWriteEnable_i,
    memBAddr          => memBAddr,
    memBWrite         => memBWrite,
    memBWriteMask     => memBWriteMask,
    memBRead          => memBRead
  );

end behave;
