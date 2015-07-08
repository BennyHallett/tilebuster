module TileBuster
  class Tile
    include TileBuster::Collidable
    include TileBuster::Drawable

    def initialize(x, y)
      @x = x
      @y = y
      @width = 30
      @height = 10
      @color = self.random_color
    end

  end
end
