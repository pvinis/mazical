require './wall'
require './z'

class Tile
  SIZE = 48
  WALL_THICKNESS = Wall::THICKNESS
  Xoffset = Hash.new 0
  Xoffset[:right] = SIZE-WALL_THICKNESS
  Yoffset = Hash.new 0
  Yoffset[:bottom] = SIZE-WALL_THICKNESS
  
  attr_reader :walls

  def initialize(x, y, left, right, top,bottom)
    @x,@y,@z = x,y,Z::GRID
    @walls = {}
    @walls[:left] = Wall.new(left, :left) ### mporo na to kano me to index? (:left, klp)
    @walls[:right] = Wall.new(right, :right)
    @walls[:top] = Wall.new(top, :top)
    @walls[:bottom] = Wall.new(bottom, :bottom)
  end
  
  def draw
    puts "d"
    @walls.each_pair do |p,w|
      w.image.draw(@x*SIZE+Xoffset[p], @y*SIZE+Yoffset[p], @z) if w.visible?
    end
  end

  def draw!
    @walls.each_pair do |p,w|
      w.image.draw(@x*SIZE+Xoffset[p], @y*SIZE+Yoffset[p], @z)
    end
  end
end