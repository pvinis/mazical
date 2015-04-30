module Visible
  NO, YES, ON_HIT, ON_PASS_LEFT, ON_PASS_RIGHT, ON_PASS_UP, ON_PASS_DOWN, STATES = *0..7
end

class Wall
  THICKNESS = 8
  Xoffset = Hash.new 0
##  Xoffset[:right] = Tile::SIZE - THICKNESS
  Yoffset = Hash.new 0
##  Yoffset[:bottom] = Tile::SIZE - THICKNESS

  def initialize(x, y, visibility, direction)
    @x,@y,@z = x,y,Z::GRID
    @v,@d = visibility,direction
    @sprite = $images[@d]
  end
  
  def self.load_images
    $images[:horizontal] = Gosu::Image.load_tiles($window, "./images/leftwall.png", THICKNESS, Tile::SIZE, false)
##    $images[:vertical] = Gosu::Image.load_tiles($window, "./images/verticalwall.png", Tile::SIZE, THICKNESS, false)
  end

  def pass_through?
    case @v
    when Visible::NO
      true
    when Visible::YES, Visible::ON_HIT
      @v = Visible::YES
      false
    end
  end

  def visible?
    @v == Visible::YES
  end

  def draw
    if $editor or visible?
      @sprite[@v].draw(@x*Tile::SIZE+Xoffset[@d], @y*Tile::SIZE+Yoffset[@d], @z)
    end
  end

  # editor methods
  def toggle
    @v = (@v + 1) % Visible::STATES
  end
end
