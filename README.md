Overview
========
Toy Robot: It is a Ruby project for simulation of Toy Robot moving on square table of dimensions 5x5.

Technologies
============
 - Language: Ruby 2.3.3p222
 - Bacon 

Inputs 
=================
<b>PLACE X,Y,F</b> <br/>
This command will put the toy robot on the table in position (X, Y) and facing NORTH, SOUTH, EAST or WEST.

<b>MOVE</b> <br/>
This command will move the toy robot one unit forward in the direction it is currently facing.

<b>LEFT,RIGHT</b> <br/>
This will rotate the robot 90 degrees in the specified direction without changing the
position of the robot.

<b>REPORT</b> <br/>
Prints the current position of robot with direction.


How to setup
============
- Install Ruby 
- Install Bacon(`gem install bacon`)


How to execute
=========
- Open Ruby console.
- Go to project folder path.
- Execute command `ruby get_commands.rb`.


How to run test cases
=========
- Open ruby console.
- install Bacon gem using command `gem install bacon`
- Go to test folder path.
- run command `bacon <filename>` (ex: bacon t_set_data.rb)
