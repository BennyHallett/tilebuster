module TileBuster
  module Drawable
    include Gosu::Color

    def color
      @color
    end

    def color=(color)
      @color = color
    end

    def random_color
      [GRAY, AQUA, RED, GREEN, BLUE, YELLOW, FUCHSIA, CYAN].sample
    end

    def draw(window)
      #window.draw_quad
    end

  end
end
