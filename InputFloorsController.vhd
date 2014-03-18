----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		CE3
-- Module Name:    	InputFloorsController - Behavioral 
-- Description: 		Shell for completing CE3
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InputFloorsController is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           floorInput : in  STD_LOGIC_Vector (3 downto 0);
           floor : out  STD_LOGIC_VECTOR (3 downto 0));
end InputFloorsController;

architecture Behavioral of InputFloorsController is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type floor_state_type is (floor0, floor1, floor2, floor3, floor4, floor5, floor6, floor7);

--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal floor_state : floor_state_type;

begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
floor_state_machine: process(clk)
begin
	--clk'event and clk='1' is VHDL-speak for a rising edge
	--if clk'event and clk='1' then
	if RISING_EDGE(CLK) then
		--reset is active high and will return the elevator to floor1
		--Question: is reset --synchronous or asynchronous?
		if reset='1' then
			floor_state <= floor0;
		--now we will code our next-state logic
		else
			case floorInput is
				--when our current state is floor1

				when "0000" =>
					if (floor_state = floor0) then 
						floor_state <= floor0;
					elsif (floor_state = floor1) then 
						floor_state <= floor0;	
					elsif (floor_state = floor2) then 
						floor_state <= floor1;
					elsif (floor_state = floor3) then 
						floor_state <= floor2;
					elsif (floor_state = floor4) then 
						floor_state <= floor3;
					elsif (floor_state = floor5) then 
						floor_state <= floor4;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor0;	
					end if;
					
				when "0001" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor1;	
					elsif (floor_state = floor2) then 
						floor_state <= floor1;
					elsif (floor_state = floor3) then 
						floor_state <= floor2;
					elsif (floor_state = floor4) then 
						floor_state <= floor3;
					elsif (floor_state = floor5) then 
						floor_state <= floor4;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor3;	
					end if;
					
					
				when "0010" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor2;
					elsif (floor_state = floor3) then 
						floor_state <= floor2;
					elsif (floor_state = floor4) then 
						floor_state <= floor3;
					elsif (floor_state = floor5) then 
						floor_state <= floor4;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor3;	
					end if;
					
					
				when "0011" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor3;
					elsif (floor_state = floor3) then 
						floor_state <= floor3;
					elsif (floor_state = floor4) then 
						floor_state <= floor3;
					elsif (floor_state = floor5) then 
						floor_state <= floor4;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor_state;	
					end if;
					
				when "0100" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor3;
					elsif (floor_state = floor3) then 
						floor_state <= floor4;
					elsif (floor_state = floor4) then 
						floor_state <= floor4;
					elsif (floor_state = floor5) then 
						floor_state <= floor4;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor_state;	
					end if;
					
				when "0101" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor3;
					elsif (floor_state = floor3) then 
						floor_state <= floor4;
					elsif (floor_state = floor4) then 
						floor_state <= floor5;
					elsif (floor_state = floor5) then 
						floor_state <= floor5;
					elsif (floor_state = floor6) then 
						floor_state <= floor5;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor_state;	
					end if;
					
				when "0110" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor3;
					elsif (floor_state = floor3) then 
						floor_state <= floor4;
					elsif (floor_state = floor4) then 
						floor_state <= floor5;
					elsif (floor_state = floor5) then 
						floor_state <= floor6;
					elsif (floor_state = floor6) then 
						floor_state <= floor6;
					elsif (floor_state = floor7) then 
						floor_state <= floor6;
					else
						floor_state <= floor3;	
					end if;
					
				when "0111" =>
					if (floor_state = floor0) then 
						floor_state <= floor1;
					elsif (floor_state = floor1) then 
						floor_state <= floor2;	
					elsif (floor_state = floor2) then 
						floor_state <= floor3;
					elsif (floor_state = floor3) then 
						floor_state <= floor4;
					elsif (floor_state = floor4) then 
						floor_state <= floor5;
					elsif (floor_state = floor5) then 
						floor_state <= floor6;
					elsif (floor_state = floor6) then 
						floor_state <= floor7;
					elsif (floor_state = floor7) then 
						floor_state <= floor7;
					else
						floor_state <= floor_state;	
					end if;
				
				--This line accounts for phantom states
				when others =>
					floor_state <= floor_state;
			end case;
		end if;
	end if;
end process;

-- Here you define your output logic. Finish the statements below
floor <= "0000" when (floor_state = floor0) else
			"0001" when (floor_state = floor1) else
			"0010" when (floor_state = floor2) else
			"0011" when (floor_state = floor3) else
			"0100" when (floor_state = floor4) else
			"0101" when (floor_state = floor5) else
			"0110" when (floor_state = floor6) else
			"0111" when (floor_state = floor7) else
			"0000";


end Behavioral;

