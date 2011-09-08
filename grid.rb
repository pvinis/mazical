class Grid
  attr_reader :starting_x, :starting_y, :tiles

  def initialize()
    @tiles = []
    @starting_x = 1
    @starting_y = 0
    ##read_level
    ##create tiles
    ###...
  end
  
  def test_grid ######
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
  
  def empty_grid #######
    @tiles = []
    ($window_height/Tile::SIZE).times do |j|
      line = []
      ($window_width/Tile::SIZE).times do |i|
        line << Tile.new(i, j, Visible::YES, Visible::ON_HIT, Visible::NO, Visible::NO)
      end
      @tiles << line
    end
    @starting_x = 1
    @starting_y = 0
    return self
  end

  def move_left_from?(x,y)
    @tiles[y][x].walls[:left].pass_through?
  end

  def move_right_from?(x,y)
    @tiles[y][x].walls[:right].pass_through?
  end

  def move_up_from?(x,y)
    @tiles[y][x].walls[:top].pass_through?
  end

  def move_down_from?(x,y)
    @tiles[y][x].walls[:bottom].pass_through?
  end

  def draw
    @tiles.each do |line|
      line.each do |tile|
        tile.draw
      end
    end
  end

  # editor methods
  def toggle_wall_at(x,y,which)
    @tiles[y][x].toggle_wall(which)
  end
end
