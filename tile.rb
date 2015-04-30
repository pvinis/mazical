class Tile
  SIZE = 48

  attr_reader :walls

  def initialize(grid, x, y, vleft, vright, vtop, vbottom)
    @grid = grid
    @x,@y,@z = x,y,Z::GRID

    @walls = {}
    if x == 0
      @walls[:left] = Wall.new(@x, @y, vleft, :vertical) ### mporo na to kano me to index? (:left, klp)
    else
      @walls[:left] = @grid.line.last.walls[:right]
    end
        
    @walls[:right] = Wall.new(@x, @y, vright, :vertical)
    
    if y == 0
      @walls[:top] = Wall.new(@x, @y, vtop, :horizontal)
    else
      p x,y
      p @grid.tiles[0][0].walls[:bottom]
      @walls[:top] = @grid.tiles.last[0].walls[:bottom]
    end
  
    @walls[:bottom] = Wall.new(@x, @y, vbottom, :horizontal)
  end

  def draw
    @walls.each_pair do |p,w|
      w.draw
    end
  end

  # editor methods
  def toggle_wall(which)
    @walls[which].toggle
  end
end
