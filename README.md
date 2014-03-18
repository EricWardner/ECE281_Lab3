ECE281_Lab3
===========
###PreLab
A schematic was created from the Nexys2_top_shell file

![alt tag](https://raw.github.com/EricWardner/ECE281_Lab3/master/top_shell_Schematic.png)

#####Documentation
C3C Spence and I compared schematics to ensure we were both on the same track and thought process. C3C Spence also scanned my schematic for me. 

###Lab
####Design Process
The overarching goal of the lab was to implement an elevator controller with varying functionality. Ultimately the functionality completed was; basic functionality, prime floor numbers, and floor input.

#####Basic Functionality
The Moore elevator controller was added to the project and simple "if statements were added for floors three and four to complete its functionality. 
```VHDL
when floor3 =>
		if (up_down='0' and stop='0') then 
			floor_state <= floor2;
		elsif (up_down='1' and stop='0') then 
			floor_state <= floor4;	
		else
			floor_state <= floor3;	
		end if;
when floor4 =>
		if (up_down='0' and stop='0') then 
			floor_state <= floor3;	
		else 
			floor_state <= floor4;
		end if;
--This line accounts for phantom states
when others =>
					floor_state <= floor1;
```
it was implemente in the topshell by adding a compoonemnt declaration and the following instantiation
```VHDL
	Inst_MooreElevatorController_Shell: MooreElevatorController_Shell PORT MAP(
		clk => ClockBus_sig(25),
		reset => btn(3),
		stop => switch(1),
		up_down => switch(0),
		floor => floorSig
	);
```

The Mealy controller was done in much the same way, the difference being the next floor output signal logic which appeared as follows

```VHDL
nextfloor <= 	"0001" when (floor_state = floor1) and (stop = '1') else
					"0010" when (floor_state = floor2) and (stop = '1') else
					"0011" when (floor_state = floor3) and (stop = '1') else
					"0100" when (floor_state = floor4) and (stop = '1') else
					"0010" when (floor_state = floor1) and (up_down = '1') and (stop = '0') else
					"0011" when (floor_state = floor2) and (up_down = '1') and (stop = '0') else
					"0100" when (floor_state = floor3) and (up_down = '1') and (stop = '0') else
					"0100" when (floor_state = floor4) and (up_down = '1') and (stop = '0') else
					"0001" when (floor_state = floor1) and (up_down = '0') and (stop = '0') else
					"0001" when (floor_state = floor2) and (up_down = '0') and (stop = '0') else
					"0010" when (floor_state = floor3) and (up_down = '0') and (stop = '0') else
					"0011" when (floor_state = floor4) and (up_down = '0') else
					"0001";  --phantom state
```

######Funtionality Check
The Moore Machine and Mealy Machine functionality was checked by Captian Silva

#####B Functionality
#######Moore Floors
In the B functionality, the Moore controller had to be implemented such that there were 8 floors by prime numbers. this was accomplishe by changing the output logic and adding an output to display the 10s place digit on the LED.

The test is shown in the following video
[![Prime Test](http://img.youtube.com/vi/cbt55nX3hn0/0.jpg)](https://www.youtube.com/watch?v=cbt55nX3hn0)

#######Change Inputs
The change inputs functionality was implemented by removing the up_down and stop inputs and adding a "floorInput" input. The case was also changed in the process to be based on that input
```VHDL
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
```
this was repeated for all floor options. 
Tesing is shown in the following video
[![Input Test](http://img.youtube.com/vi/yOPqu9JjM1E/0.jpg)](https://www.youtube.com/watch?v=yOPqu9JjM1E)

#Code Critique 
The given top shell had some bad code in it. 

######Bad Code
```VHDL
if clk'event and clk='1' then
```
This works but is bad syntax because it uses the "and" contitional logic. Better more widley used code is as follows
######Good Code
```VHDL
if RISING_EDGE(CLK) then
```
######Bad Code
```VHDL
when floor1 =>
	if (up_down='1' and stop='0') then 
````
This code is bad becasue the output logic is put in the state logic. like so
######Good Code
```VHDL
floor <= "0001" when (floor_state = floor1) and (up_down = 1) else
```

#Functionality
###Basic Moore
###Basic Mealy
###Moore Floors
###Change Inputs
###Light Show
###Two Elevators
