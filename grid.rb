require './tile'

class Grid
  attr_reader :starting_x, :starting_y, :tiles

  def initialize()
    @tiles = []
    ##read_level
    ##create tiles
    ###...
  end
  
  def test_grid 
    @tiles = []
    line = []
    line << Tile.new(0, 0, Visible::ON_HIT, Visible::ON_HIT, Visible::ON_HIT, Visible::ON_HIT)
    line << Tile.new(1, 0, Visible::ON_HIT, Visible::ON_HIT, Visible::YES, Visible::NO)
    @tiles << line
    line = []
    line << Tile.new(0, 1, Visible::ON_HIT, Visible::NO, Visible::NO, Visible::ON_HIT)
    line << Tile.new(1, 1, Visible::NO, Visible::ON_HIT, Visible::NO, Visible::ON_HIT)
    @tiles << line
    @starting_x = 1
    @starting_y = 0
    return self
  end

  def go_left_from?(x,y)
    @tiles[y][x].walls[:left].pass_through?
  end

  def go_right_from?(x,y)
    @tiles[y][x].walls[:right].pass_through?
  end

  def go_up_from?(x,y)
    @tiles[y][x].walls[:top].pass_through?
  end

  def go_down_from?(x,y)
    @tiles[y][x].walls[:bottom].pass_through?
  end
      
  def draw
    @tiles.each do |line|
      line.each do |tile|
        tile.draw
      end
    end
  end
end
