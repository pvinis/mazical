# Mazical

require 'gosu'
require './ball'

class GameWindow < Gosu::Window
  def initialize
    super(960,640,false)
    self.caption = "Mazical"
    @window = self
###    @grid = Grid.new
  @player = Ball.new(self, 20, 50)
  @level
  end
  
#  def button_down(id)
#    @ball.go_left if id == Gosu::Button::KbLeft
#    @ball.go_right if id == Gosu::Button::KbRight
#    @ball.go_up if id == Gosu::Button::KbUp
#    @ball.go_down if id == Gosu::Button::KbDown
#  end
  
  def update
    @player.go_left if button_down? Gosu::Button::KbLeft
    @player.go_right if button_down? Gosu::Button::KbRight
    @player.go_up if button_down? Gosu::Button::KbUp
    @player.go_down if button_down? Gosu::Button::KbDown
  end
  
  def draw
    @player.draw
  end
end


# start game
GameWindow.new.show