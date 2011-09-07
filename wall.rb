require 'gosu'

module Visible
  NO, YES, ON_HIT, STATES = *0..3
  ####RADIUS
  def self.to_s(v)
    case v
    when NO
      "no"
    when YES
      "yes"
    when ON_HIT
      "onhit"
    end
  end
end

class Wall
  THICKNESS = 8
  
  attr_reader :image

  def initialize(visibility, position)
    @v,@p = visibility,position
    select_image
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

  # editor methods
  def toggle
    @v = (@v + 1) % Visible::STATES
    select_image
  end
  
  def select_image
    if $editor and !visible?
      @image = $images[(@p.to_s+"_"+Visible.to_s(@v)).to_sym]
      puts "1"
      puts (@p.to_s+"_"+Visible.to_s(@v)).to_sym
    else
      @image = $images[@p]
      puts "2"
      puts @p
    end
  end

  def visible?
    @v == Visible::YES
  end
end
