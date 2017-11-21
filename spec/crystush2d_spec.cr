require "./spec_helper"
require "./instructions/**"

describe Crystush2d do

  it "should handle every listed instruction" do
    Crystush2d::Program::INSTRUCTIONS.each do |instruction|
      Crystush2d::Program.new(instruction).evaluate
    end
  end

  it "should still execute Crystush Programs properly" do
    # "scrambled-looking arithmetic:
    program = "( 5 1.23 INTEGER.+ ( 4 ) INTEGER.- 5.67 FLOAT.* )"
    stacks = Crystush2d::Program.new(program).evaluate
    # CODE STACK: ( ( 5 1.23 INTEGER.+ ( 4 ) INTEGER.- 5.67 FLOAT.* ) )
    stacks.code_stack.size.should eq(1)
    stacks.code_stack[0].should eq("( 5 1.23 INTEGER.+ ( 4 ) INTEGER.- 5.67 FLOAT.* )")
    # FLOAT STACK: ( 6.9741 )
    stacks.float_stack.size.should eq(1)
    stacks.float_stack[0].should eq(6.9741)
    # INTEGER STACK: ( 1 )
    stacks.integer_stack.size.should eq(1)
    stacks.integer_stack[0].should eq(1)
  end


end
