module TileBuster
  class Tile
    include TileBuster::Collidable

    def initialize(x, y)
      @x = x
      @y = y
      @width = 20
      @height = 6
      @color = random_color
    end

    def random_color
      %i(red blue green yellow pink).sample
    end

  end
end
