require 'gosu'

module TileBuster
  module Drawable

    def color
      @color
    end

    def color=(color)
      @color = color
    end

    def random_color
      [Gosu::Color::AQUA, Gosu::Color::RED, Gosu::Color::GREEN, Gosu::Color::BLUE, Gosu::Color::YELLOW, Gosu::Color::FUCHSIA, Gosu::Color::CYAN].sample
    end

    def draw(window)
      window.draw_quad(@x, @y, color, @x + @width, @y, color, @x + @width, @y + @height, color, @x, @y + @height, color)
    end

  end
end
