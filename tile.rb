require './wall'
require './z'

class Tile
  SIZE = 24
  WALL_THICKNESS = Wall::THICKNESS
  Xoffset = Hash.new 0
  Xoffset[:right] = 24-WALL_THICKNESS
  Yoffset = Hash.new 0
  Yoffset[:bottom] = 24-WALL_THICKNESS

  def initialize(x, y, left, right, top,bottom)
    @x,@y,@z = x,y,Z::GRID
    @walls = {}
    @walls[:left] = Wall.new(left, Position::LEFT) ### mporo na to kano me to index? (:left, klp)
    @walls[:right] = Wall.new(right, Position::RIGHT)
    @walls[:top] = Wall.new(top, Position::TOP)
    @walls[:bottom] = Wall.new(bottom, Position::BOTTOM) 
  end
  
  def draw
    @walls.each_pair do |p,w|
      $images[p].draw(@x*SIZE+Xoffset[p], @y*SIZE+Yoffset[p], @z) if w.visible?
    end
  end
end