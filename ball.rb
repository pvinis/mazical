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
  def move_left
    @x -= 1 if @level.move_left_from?(@x,@y)
  end
  
  def move_right
    @x += 1 if @level.move_right_from?(@x,@y)
  end
  
  def move_up
    @y -= 1 if @level.move_up_from?(@x,@y)
  end
  
  def move_down
    @y += 1 if @level.move_down_from?(@x,@y)
  end

  def draw
    $images[:ball].draw(@x*Tile::SIZE+Xoffset, @y*Tile::SIZE+Yoffset, @z)
    ####make it look like it slides, instead of jumping to the next tile
  end
end