require './wall'

class Tile
  SIZE = 24

  def initialize(window, left, right, top,bottom)
    @window = window
    @walls[:left] = Wall.new(@window, left, Position::LEFT)
    @walls[:right] = Wall.new(@window, right, Position::RIGHT)
    @walls[:top] = Wall.new(@window, top, Position::TOP)
    @walls[:bottom] = Wall.new(@window, bottom, Position::BOTTOM) 
  end
end