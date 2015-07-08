module TileBuster
  module Collidable

    class Point
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end
    end

    def top_left
      Point.new(@x, @y)
    end

    def bottom_right
      Point.new(@x + @width, @y + @height)
    end

    def collides_with(other)
      top_left.x < other.bottom_right.x &&
        bottom_right.x > other.top_left.x &&
        top_left.y < other.bottom_right.y &&
        bottom_right.y > other.top_left.y
    end

  end
end
