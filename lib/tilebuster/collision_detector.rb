module TileBuster
  class CollisionDetector

    def initialize(ball, paddle, tiles)
      @ball = ball
      @paddle = paddle
      @tiles = tiles
    end

    def detect
      check_ball_paddle_collision
      check_ball_tile_collision
    end

    private

    def check_ball_paddle_collision
      @ball.top_bottom_collision if @ball.collides_with(@paddle)
    end

    def check_ball_tile_collision
      @tiles.each do |tile|
        if @ball.collides_with(tile)
          @ball.top_bottom_collision
          @tiles.delete tile
        end
      end
    end

  end
end
