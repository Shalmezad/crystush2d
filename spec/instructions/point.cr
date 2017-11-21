describe Crystush2d do
  it "should make a point from floats" do
    desiredPoint = Crystush2d::Point.new(1.0, 2.0)
    program = "( 1.0 2.0 POINT.FROMFLOATS )"
    stacks = Crystush2d::Program.new(program).evaluate
    stacks.point_stack.size.should eq(1)
    stacks.point_stack[0].should eq(desiredPoint)
  end

  it "should duplicate a point" do
    desiredPoint = Crystush2d::Point.new(1.0, 2.0)
    program = "( 1.0 2.0 POINT.FROMFLOATS POINT.DUP)"
    stacks = Crystush2d::Program.new(program).evaluate
    stacks.point_stack.size.should eq(2)
    stacks.point_stack[0].should eq(desiredPoint)
    stacks.point_stack[1].should eq(desiredPoint)
  end


end
