require_relative 'lib/set_data'
class Command
    
	# Initialize data Hash with default values 
	def initialize
		@data_hash = {"direction"=>"null", "dimensions"=>{"x"=>0,"y"=>0}}
	end
	# method that takes input command from command line and initiates required action
	def get_command
	    
			input = STDIN.gets();
		begin
			full_string = input.split(/\s+/);
			command = full_string.first.upcase;
			if(command != "PLACE" && @data_hash["direction"] == "null")
				puts "Place the Robot first"
			else
				case command
				# PLACE: command to place the robot at input location with direction
				when "PLACE" 
				       dir = full_string[1].split(',')[2].upcase
					   x_val = full_string[1].split(',')[0].to_i
					   y_val = full_string[1].split(',')[1].to_i
				    if (["NORTH","SOUTH","EAST","WEST"].include? dir) && x_val.between?(0, 5) && y_val.between?(0, 5)
						@data_hash["direction"] = dir
						@data_hash["dimensions"]["x"] = x_val
						@data_hash["dimensions"]["y"] = y_val
					else
						puts "Invalid Arguments"
					end
				# MOVE: command to move robot by 1 unit in the direction it is facing
				when "MOVE"
					result_hash = GetSetData.new.move_robot(@data_hash["dimensions"]["x"],@data_hash["dimensions"]["y"],@data_hash["direction"])
					if result_hash["direction"] == "outside"
						puts "outside of the table"
					else
						set_hash_data(result_hash);
					end
				# LEFT : change direction of robot to left from current direction
				when "LEFT"
					set_hash_data(GetSetData.new.change_direction(@data_hash["dimensions"]["x"],@data_hash["dimensions"]["y"],@data_hash["direction"],"LEFT"))
				# RIGHT : change direction of robot to right from current direction
				when "RIGHT"
					set_hash_data(GetSetData.new.change_direction(@data_hash["dimensions"]["x"],@data_hash["dimensions"]["y"],@data_hash["direction"], "RIGHT"))
				# REPORT : Show current location and direction of the robot
				when "REPORT"
					puts @data_hash["dimensions"]["x"].to_s+ ","+ @data_hash["dimensions"]["y"].to_s+","+@data_hash["direction"];
				else
				    puts "Invalid command"
				end #end of case
			end #end of if
				
		rescue		        
		puts "Invalid command"
		end
		get_command
	end # end get_command
	
	# method to save changes in the data hash
	def set_hash_data(input)
				@data_hash = input;
	end # end set_hash_data
end
# Class initialising
Command.new.get_command