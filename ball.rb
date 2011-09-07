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

  # editor methods
  def move_left!
    @x -= 1 if @x > 0
  end
  
  def move_right!
    @x += 1 if @x < $window_width/Tile::SIZE
  end
  
  def move_up!
    @y -= 1 if @y > 0
  end
  
  def move_down!
    @y += 1 if @y < $window_height/Tile::SIZE
  end
  
  def toggle_wall(which)
    @level.toggle_wall_at(@x,@y,which)
  end

  def draw
    $images[:ball].draw(@x*Tile::SIZE+Xoffset, @y*Tile::SIZE+Yoffset, @z)
    ####make it look like it slides, instead of jumping to the next tile
  end
end