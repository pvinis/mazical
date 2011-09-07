# Editor

require './mazical'

class EditorWindow < GameWindow

  def initialize
    super
    self.caption = "Editor"
    $editor = true
    @level = Grid.new.empty_grid
  end
  
  def load_images
    super
    $images[:left_no] = Gosu::Image.new($window, "./images/leftwall-no.png")
    $images[:right_no] = Gosu::Image.new($window, "./images/rightwall-no.png")
    $images[:top_no] = Gosu::Image.new($window, "./images/topwall-no.png")
    $images[:bottom_no] = Gosu::Image.new($window, "./images/bottomwall-no.png")
    $images[:left_onhit] = Gosu::Image.new($window, "./images/leftwall-onhit.png")
    $images[:right_onhit] = Gosu::Image.new($window, "./images/rightwall-onhit.png")
    $images[:top_onhit] = Gosu::Image.new($window, "./images/topwall-onhit.png")
    $images[:bottom_onhit] = Gosu::Image.new($window, "./images/bottomwall-onhit.png")
  end

  def button_down(id)
    @player.move_left! if button_down? Gosu::Button::KbLeft
    @player.move_right! if button_down? Gosu::Button::KbRight
    @player.move_up! if button_down? Gosu::Button::KbUp
    @player.move_down! if button_down? Gosu::Button::KbDown

    @player.toggle_wall(:left) if button_down? Gosu::Button::KbA
    @player.toggle_wall(:right) if button_down? Gosu::Button::KbD
    @player.toggle_wall(:top) if button_down? Gosu::Button::KbW
    @player.toggle_wall(:bottom) if button_down? Gosu::Button::KbS
  end
  
  def draw
    $images[:background].draw(0,0,Z::BACKGROUND)
    @level.draw!
    @player.draw
  end
end
