require 'gosu'

class Wall
  def initialize(visibility, position)
    @v,@p = visibility,position
    @hit = false
    @image = Gosu::Image.new($window, "images/" + case @p
      when Position::LEFT
        "left"
      when Position::RIGHT
        "right"
      when Position::TOP
        "top"
      when Position::BOTTOM
        "bottom"
      end + "wall.png")
  end
  
  def hit
    @hit = true
    @v = Visible::YES
  end
  
  def hit?
    @hit
  end
  
  def visible?
    @v == Visible::YES
  end

  def draw
    if visible?
      @image.draw(@x,@y,1,1,1,123)########
    end
  end
end

class Visibe
  NO, YES, AFTER_HIT, RADIUS = (0..3).to_a
end

class Position
  LEFT, RIGHT, TOP, BOTTOM = (0..3).to_a
end
