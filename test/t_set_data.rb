require_relative '../lib/set_data'
require 'bacon'
require 'rubygems'

describe "Bacon" do
  
  before do 
  @set_data = GetSetData.new()
  end
  
  it "move_robot should return correct result" do
  expected  = {"direction"=>"NORTH", "dimensions"=>{"x"=>0,"y"=>1}}
  result = @set_data.move_robot(0, 0, "NORTH")
  result.should.equal expected
  end
  
  it "move_robot should not move for outside table" do
  expected  = {"direction" =>"outside"}
  result = @set_data.move_robot(5, 5, "NORTH")
  result.should.equal expected
  end
  
  it "move_robot should return hash type data" do
  result = @set_data.move_robot(0, 0, "NORTH")
  result.should.be.kind_of(Hash)
  end
  
  it "move_robot should return wrong result" do
  expected  = {"direction"=>"NORTH", "dimensions"=>{"x"=>0,"y"=>0}}
  result = @set_data.move_robot(0, 0, "NORTH")
  result.should.not.equal expected
  end
  
    it "change_direction should return correct result for NORTH" do
  expected  = {"direction"=>"NORTH", "dimensions"=>{"x"=>0,"y"=>0}}
  result = @set_data.change_direction(0, 0, "EAST","LEFT")
  result.should.equal expected
  end
  
    it "change_direction should return correct result for SOUTH" do
  expected  = {"direction"=>"SOUTH", "dimensions"=>{"x"=>0,"y"=>0}}
  result = @set_data.change_direction(0, 0, "EAST","RIGHT")
  result.should.equal expected
  end
  
    it "change_direction should return correct result for EAST" do
  expected  = {"direction"=>"EAST", "dimensions"=>{"x"=>0,"y"=>0}}
  result = @set_data.change_direction(0, 0, "NORTH","RIGHT")
  result.should.equal expected
  end
  
    it "change_direction should return correct result for WEST" do
  expected  = {"direction"=>"WEST", "dimensions"=>{"x"=>0,"y"=>0}}
  result = @set_data.change_direction(0, 0, "SOUTH","RIGHT")
  result.should.equal expected
  end
  
  end