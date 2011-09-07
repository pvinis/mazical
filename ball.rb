require './tile'
require './z'

class Ball
  Xoffset = Wall::THICKNESS
  Yoffset = Wall::THICKNESS

  def initialize(level)
    @level = level
    @x,@y,@z = @level.starting_x,@level.starting_y,Z::GRID
  end
  
  # (0,0) is top left
  def go_left
    @x -= 1 if @level.go_left_from?(@x,@y)
  end
  
  def go_right
    @x += 1 if @level.go_right_from?(@x,@y)
  end
  
  def go_up
    @y -= 1 if @level.go_up_from?(@x,@y)
  end
  
  def go_down
    @y += 1 if @level.go_down_from?(@x,@y)
  end

  def draw
    $images[:ball].draw(@x*Tile::SIZE+Xoffset, @y*Tile::SIZE+Yoffset, @z)
    ####make it look like it slides, instead of jumping to the next tile
  end
end