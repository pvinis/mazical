class Grid
  attr_reader :starting_x, :starting_y, :tiles
  attr_reader :line

  def initialize()
    @tiles = []
    @starting_x = 1
    @starting_y = 0
    ##read_level
    ##create tiles
    ###...
  end
  
  def test_grid
    @tiles = []
    @line = []
    puts "2"
    @line << Tile.new(self, 0, 0, Visible::YES, Visible::ON_HIT, Visible::YES, Visible::ON_PASS_UP)
    puts "3"
    @line << Tile.new(self, 1, 0, nil, Visible::ON_HIT, Visible::NO, Visible::YES)
    puts "31"
    @line << Tile.new(self, 2, 0, nil, Visible::ON_HIT, Visible::ON_HIT, Visible::NO)
    puts "4"
    @tiles << line
    @line = []
    @line << Tile.new(self, 0, 1, Visible::ON_HIT, Visible::NO, nil, Visible::YES)
    @line << Tile.new(self, 1, 1, nil, Visible::NO, nil, Visible::YES)
    @line << Tile.new(self, 2, 1, nil, Visible::NO, nil, Visible::YES)
    @tiles << line
    @starting_x = 2
    @starting_y = 0
    return self
  end

#  def test_grid ######
#    @tiles = []
#    line = []
#    line << Tile.new(0, 0, Visible::ON_HIT, Visible::ON_HIT, Visible::ON_HIT, Visible::ON_HIT)
#    line << Tile.new(1, 0, Visible::ON_HIT, Visible::ON_HIT, Visible::YES, Visible::NO)
#    @tiles << line
#    line = []
#    line << Tile.new(0, 1, Visible::ON_HIT, Visible::NO, Visible::NO, Visible::ON_HIT)
#    line << Tile.new(1, 1, Visible::NO, Visible::ON_HIT, Visible::NO, Visible::ON_HIT)
#    @tiles << line
#    @starting_x = 1
#    @starting_y = 0
#    return self
#  end
  
  def empty_grid
    @tiles = []
    ($window_height/Tile::SIZE).times do |j|
      line = []
      ($window_width/Tile::SIZE).times do |i|
        line << Tile.new(i, j, Visible::NO, Visible::NO, Visible::NO, Visible::NO)
      end
      @tiles << line
    end
    @starting_x = 0
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
        #tile.draw
      end
    end
  end

  # editor methods
  def toggle_wall_at(x,y,which)
    @tiles[y][x].toggle_wall(which)
  end
end
