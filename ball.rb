require './tile'
require './z'

class Ball
  TILESIZE = Tile::SIZE

  def initialize(x, y)
    @x,@y,@z = x,y,Z::GRID
  end
  
  # (0,0) is top left
  def go_left
    ##TILESIZE.times { @x -= 1 }
    @x -= TILESIZE
  end
  
  def go_right
    @x += TILESIZE
  end
  
  def go_up
    @y -= TILESIZE
  end
  
  def go_down
    @y += TILESIZE
  end

  def draw
    $images[:ball].draw(@x, @y, @z)
  end
end