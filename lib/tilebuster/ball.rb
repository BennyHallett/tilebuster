module TileBuster
  class Ball
    include TileBuster::Settings
    include TileBuster::Collidable

    def initialize
      @width = 4
      @height = 4
      @x = ((screen_width / 2) - (@width / 2)).to_i
      @y = screen_height - 100
      @dx = 1.2
      @dy = -0.5
    end

    def top_bottom_collision
      @dx *= -1
    end

    def left_right_collision
      @dy *= -1
    end

    def update
      @x += @dx
      @y += @dy

      bounce if out_of_bounds?
    end

    def out_of_bounds?
      out_sides? || out_ends?
    end

    def out_sides?
      @x < 0 || (@x + @width) > screen_width
    end

    def out_ends?
      @y < 0 || (@y + @height) > screen_height
    end

    def bounce
      left_right_collision if out_sides?
      top_bottom_collision if out_ends?
    end

  end
end
