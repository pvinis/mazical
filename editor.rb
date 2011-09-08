# Editor

class EditorWindow < GameWindow
  def initialize
    $editor = true
    super
    self.caption = "Editor"
    @level = Grid.new.empty_grid
    @player = Ball.new(@level)
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
    @player.set_starting_position if button_down? Gosu::Button::KbQ
    @player.set_finishing_position if button_down? Gosu::Button::KbE
  end
end
