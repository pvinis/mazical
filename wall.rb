module Visible
  NO, YES, ON_HIT, STATES = *0..3
end

class Wall
  THICKNESS = 8
  Xoffset = Hash.new 0
  Xoffset[:right] = Tile::SIZE - THICKNESS
  Yoffset = Hash.new 0
  Yoffset[:bottom] = Tile::SIZE - THICKNESS

  def initialize(x, y, visibility, position)
    @x,@y,@z = x,y,Z::GRID
    @v,@p = visibility,position
    @sprite = $images[@p]
  end
  
  def self.load_images
    $images[:left] = Gosu::Image.load_tiles($window, "./images/leftwall.png", THICKNESS, Tile::SIZE, false)### na valo anti gia 8 kai 48 ta size kai thickness
    $images[:right] = Gosu::Image.load_tiles($window, "./images/rightwall.png", THICKNESS, Tile::SIZE, false)### na valo anti gia 8 kai 48 ta size kai thickness
    $images[:top] = Gosu::Image.load_tiles($window, "./images/topwall.png", Tile::SIZE, THICKNESS, false)### na valo anti gia 8 kai 48 ta size kai thickness
    $images[:bottom] = Gosu::Image.load_tiles($window, "./images/bottomwall.png", Tile::SIZE, THICKNESS, false)### na valo anti gia 8 kai 48 ta size kai thickness
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
      @sprite[@v].draw(@x*Tile::SIZE+Xoffset[@p], @y*Tile::SIZE+Yoffset[@p], @z)
    end
  end

  # editor methods
  def toggle
    puts @v
    @v = (@v + 1) % Visible::STATES
  end
end
