require 'tilebuster/settings'
require 'tilebuster/ball'
require 'tilebuster/collidable'
require 'tilebuster/drawable'
require 'gosu'
require 'securerandom'

module TileBuster
  class Ball
    include TileBuster::Settings
    include TileBuster::Collidable
    include TileBuster::Drawable

    def initialize
      @width = 8
      @height = 8
      @x = ((screen_width / 2) - (@width / 2)).to_i
      @y = screen_height - 100
      @dx = 2.5
      @dy = -2.5
      self.color = Gosu::Color::YELLOW
    end

    def top_bottom_collision
      @dy = (@dy * -1) + tweak
    end

    def left_right_collision
      @dx = (@dx * -1) + tweak
    end

    def tweak
      (SecureRandom.random_number * 2) - 1
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
