class GetSetData
    # method to move robot from 1 unit in current direction and if in the range of table dimensions
	# Parameters:  x: x co-ordinate, y: y co-ordinate, dir: input direction
	def move_robot(x, y, dir)
				x_dir = x.to_i
		y_dir = y.to_i
		direction  = dir.to_s
		case direction
		when 'NORTH'
			y_dir = y_dir+1
		when 'SOUTH'
			y_dir = y_dir-1
		when 'EAST'
			x_dir = x_dir+1
		when 'WEST'
			x_dir = x_dir-1
		else
		end
				if(x_dir>5 || x_dir<0 || y_dir>5 || y_dir<0)
			return {"direction" =>"outside"}
		else
			return {"direction"=>dir, "dimensions"=>{"x"=>x_dir,"y"=>y_dir}};
		end
	end
		
    # method to change direction of the robot left or right		
	# Parameters:  x: x co-ordinate, y: y co-ordinate, dir: input direction, move: movement direction
	def change_direction(x, y, dir, move)
		new_dir = dir
		case dir
		when 'NORTH'
			new_dir = (move=="LEFT"? "WEST" : "EAST")
		when 'SOUTH'
			new_dir = (move=="LEFT"? "EAST" : "WEST")
		when 'EAST'
			new_dir =  (move=="LEFT"? "NORTH" : "SOUTH")
		when 'WEST'
			new_dir =  (move=="LEFT"? "SOUTH" : "NORTH")
		else
		end
		return {"direction"=>new_dir, "dimensions"=>{"x"=>x.to_i,"y"=>y.to_i}};
	end
end
