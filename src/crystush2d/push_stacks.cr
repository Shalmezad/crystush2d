require "crystush"
module Crystush2d
  class PushStacks < Crystush::PushStacks
    # TODO: Make array of Point[s]
    property point_stack : Array(String) = [] of String

    def to_s(io)
      super.to_s(io)
      io << "POINT  : " << point_stack << "\n"
    end
  end
end
