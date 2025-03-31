----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 11:20:32
-- Design Name: 
-- Module Name: speedsensor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity speedsensor is
    Port ( 
        signal_in: in std_logic;
        clk:    in  std_logic;
        result: out std_logic_vector(31 downto 0) := (others => '0')
    );
end speedsensor;

architecture Behavioral of speedsensor is
    signal counter     : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal counting    : std_logic := '1';
    signal signal_reg  : STD_LOGIC := '0';
begin
process (clk)
    begin
        if rising_edge(clk) then
            if signal_in = '1' and signal_reg = '0' then  -- Detect rising edge of snapshot
                result <= counter;  -- Store counter value to output
                counter <= (others => '0'); -- Reset counter
                counting <= '1'; -- Resume counting
            --end if;
            elsif counting = '1' then
                counter <= std_logic_vector(unsigned(counter) + "1");
                if counter = X"FFFFFFFF" then  -- Detect overflow
                    counting <= '0'; -- Stop counting on overflow
                    counter <= (others => '0'); -- Reset counter
                end if;
            end if;
            signal_reg <= signal_in; -- Register snapshot input for edge detection
        end if;
        
    end process;

end Behavioral;
