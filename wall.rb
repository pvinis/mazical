require 'gosu'

module Visible
  NO, YES, AFTER_HIT, RADIUS = (0..3).to_a
end

module Position
  LEFT, RIGHT, TOP, BOTTOM = (0..3).to_a
end

class Wall
  THICKNESS = 4

  def initialize(visibility, position)
    @v,@p = visibility,position
    @hit = false
    @image = Gosu::Image.new($window, "images/" + case @p#########na kano load sto main oles tis eikones, kai na exo ena ref..
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
end
