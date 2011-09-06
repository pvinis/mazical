require './tile'

class Ball
  TILESIZE = Tile::SIZE

  def initialize(x, y)
    @x,@y = x,y
    @image = Gosu::Image.new($window, "images/ball.png")
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
    @image.draw(@x, @y, 0)
  end
end