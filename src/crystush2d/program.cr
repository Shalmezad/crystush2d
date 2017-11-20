require "crystush"
module Crystush2d
  class Program < Crystush::Program
    INSTRUCTIONS = Crystush::Program::INSTRUCTIONS.concat([
      "POINT.DUP"
    ])

    def initialize(program : String)
      super(program)
    end

    def evaluate(stacks : Crystush2d::PushStacks = Crystush2d::PushStacks.new) : Crystush2d::PushStacks
      return super(stacks)
    end

    def execute_instruction(instruction : String, stacks : Crystush2d::PushStacks)
      # TODO: Actually handle instruction
      if instruction.starts_with? "POINT."
        puts "Executing: #{instruction}"
      else
        super(instruction, stacks)
      end
    end

  end
end
