require "crystush"
module Crystush2d
  class PushStacks < Crystush::PushStacks
    property point_stack : Array(Point) = [] of Point

    def to_s(io)
      super(io)
      io << "POINT  : " << point_stack << "\n"
    end
  end
end
