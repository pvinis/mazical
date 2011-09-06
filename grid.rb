require './tile'

class Grid
  def initialize()
    @tiles = []
    ##read_level
    ##create tiles
    ###...
  end
  
  def test_grid 
    @tiles = []
    line = []
    line << Tile.new(0, 0, Visible::YES, Visible::YES, Visible::YES, Visible::YES)
    line << Tile.new(1, 0, Visible::YES, Visible::YES, Visible::YES, Visible::NO)
    @tiles << line
    line = []
    line << Tile.new(0, 1, Visible::YES, Visible::YES, Visible::YES, Visible::YES)
    line << Tile.new(1, 1, Visible::YES, Visible::YES, Visible::YES, Visible::YES)
    @tiles << line
    return self
  end

  def draw
    @tiles.each do |line|
      line.each do |tile|
        tile.draw
      end
    end
  end
end
