module Crystush2d
  class Point
    property x : Float64
    property y : Float64

    def initialize( x : Float64, y : Float64)
      @x = x
      @y = y
    end

    def ==(other)
      self.x == other.x && self.y == other.y
    end

    def to_s(io)
      io << "(" << x << "," << y << ")"
    end
  end
end
