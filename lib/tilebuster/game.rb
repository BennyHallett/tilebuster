require 'gosu'
require 'tilebuster/settings'

module TileBuster
  class Game < Gosu::Window
    include TileBuster::Settings

    def initialize
      super screen_width, screen_height
      self.caption = 'TileBuster'

      @ball = @ball.new
    end

    def update
      @ball.update
    end

    def draw
      @ball.draw
    end

  end
end
