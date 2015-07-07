require 'gosu'
require 'tilebuster/settings'
require 'tilebuster/ball'

module TileBuster
  class Game < Gosu::Window
    include TileBuster::Settings

    def initialize
      super screen_width, screen_height
      self.caption = 'TileBuster'

      @ball = ::TileBuster::Ball.new
    end

    def update
      @ball.update
    end

    def draw
      @ball.draw(self)
    end

  end
end
