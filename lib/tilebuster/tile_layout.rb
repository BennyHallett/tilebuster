require 'tilebuster/tile'

module TileBuster
  class TileLayout

    def self.generate
      tiles = []
      (0..12).each do |row|
        # 15 + 1 per row
        (0..15).each do |col|
          tiles << TileBuster::Tile.new(20 + (38 * col), 18 + (18 * row))
        end
      end

      tiles
    end

  end
end
