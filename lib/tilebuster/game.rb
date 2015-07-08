require 'gosu'
require 'tilebuster/settings'
require 'tilebuster/ball'
require 'tilebuster/paddle'
require 'tilebuster/tile_layout'
require 'tilebuster/collision_detector'

module TileBuster
  class Game < Gosu::Window
    include TileBuster::Settings

    def initialize
      super screen_width, screen_height
      self.caption = 'TileBuster'

      @ball = ::TileBuster::Ball.new
      @paddle = ::TileBuster::Paddle.new
      @tiles = ::TileBuster::TileLayout.generate
      @collision = ::TileBuster::CollisionDetector.new(@ball, @paddle, @tiles)
    end

    def update
      if Gosu::button_down?(Gosu::KbLeft) || Gosu::button_down?(Gosu::KbH)
        @paddle.moving_left
      elsif Gosu::button_down?(Gosu::KbRight) || Gosu::button_down?(Gosu::KbL)
        @paddle.moving_right
      else
        @paddle.stop
      end


      @ball.update
      @paddle.update
      @collision.detect
    end

    def draw
      panel = self

      @ball.draw(panel)
      @paddle.draw(panel)
      @tiles.each { |t| t.draw(panel) }
    end

  end
end
