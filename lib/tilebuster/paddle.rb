require 'tilebuster/settings'
require 'tilebuster/collidable'
require 'tilebuster/drawable'

module TileBuster
  class Paddle
    include TileBuster::Settings
    include TileBuster::Collidable
    include TileBuster::Drawable

    def initialize
      @width = 65
      @height = 10
      @x = ((screen_width / 2) - (@width / 2)).to_i
      @y = screen_height - 35
      @direction = 0
      self.color = Gosu::Color::GRAY
    end

    def moving_left
      @direction = -5
    end

    def moving_right
      @direction = 5
    end

    def stop
      @direction = 0
    end

    def update
      @x += @direction
      reset_within_bounds if out_of_bounds?
    end

    def out_of_bounds?
      @x < 0 || (@x + @width) > screen_width
    end

    def reset_within_bounds
      if @x < 0
        @x = 0
      else
        @x = screen_width - @width
      end
    end

  end
end
