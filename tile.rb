class Tile
  SIZE = 48

  attr_reader :walls

  def initialize(x, y, vleft, vright, vtop, vbottom)
    @x,@y,@z = x,y,Z::GRID

    @walls = {}
    @walls[:left] = Wall.new(@x, @y, vleft, :left) ### mporo na to kano me to index? (:left, klp)
    @walls[:right] = Wall.new(@x, @y, vright, :right)
    @walls[:top] = Wall.new(@x, @y, vtop, :top)
    @walls[:bottom] = Wall.new(@x, @y, vbottom, :bottom)
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
