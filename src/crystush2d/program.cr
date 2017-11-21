require "crystush"
module Crystush2d
  class Program < Crystush::Program
    INSTRUCTIONS = Crystush::Program::INSTRUCTIONS.concat([
      "POINT.DUP",
      "POINT.FROMFLOATS"
    ])

    def initialize(program : String)
      super(program)
    end

    def evaluate(stacks : Crystush2d::PushStacks = Crystush2d::PushStacks.new) : Crystush2d::PushStacks
      return super(stacks)
    end

    def execute_instruction(instruction : String, stacks : Crystush2d::PushStacks)
      if instruction.starts_with? "POINT."
        execute_point_instruction(instruction, stacks)
      else
        super(instruction, stacks)
      end
    end

    def execute_point_instruction(instruction : String, stacks : Crystush2d::PushStacks)
      if instruction == "POINT.DUP"
        # We need 1 point
        return if stacks.point_stack.size < 1
        result = stacks.point_stack.pop
        # Push twice
        stacks.point_stack.push result
        stacks.point_stack.push result
      elsif instruction == "POINT.FROMFLOATS"
        # We need 2 points
        return if stacks.float_stack.size < 2
        # Pull them off
        y = stacks.float_stack.pop
        x = stacks.float_stack.pop
        result = Point.new(x,y)
        stacks.point_stack.push result
      end
    end

  end
end
