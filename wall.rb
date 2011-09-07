require 'gosu'

module Visible
  NO, YES, ON_HIT, RADIUS = *0..3
end

module Position
  LEFT, RIGHT, TOP, BOTTOM = *0..3
end

class Wall
  THICKNESS = 8

  def initialize(visibility, position)
    @v,@p = visibility,position
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
  
  def pass_through?
    case @v
    when Visible::NO
      true
    when Visible::YES,Visible::ON_HIT
      @v = Visible::YES
      false
    end
  end

  def visible?
    @v == Visible::YES
  end
end
