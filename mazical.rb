# Mazical

require 'gosu'
require './grid'
require './ball'

class GameWindow < Gosu::Window
  def initialize
    super(960,640,false)
    self.caption = "Mazical"
    $window = self
    load_images
###    @grid = Grid.new
    @level = Grid.new.test_grid####
    @player = Ball.new(20, 50)#######
  end
  
  def load_images
    $images = {}
    $images[:ball] = Gosu::Image.new($window, "images/ball.png")
    $images[:left] = Gosu::Image.new($window, "images/leftwall.png")
    $images[:right] = Gosu::Image.new($window, "images/rightwall.png")
    $images[:top] = Gosu::Image.new($window, "images/topwall.png")
    $images[:bottom] = Gosu::Image.new($window, "images/bottomwall.png")
  end

  def update
    @player.go_left if button_down? Gosu::Button::KbLeft
    @player.go_right if button_down? Gosu::Button::KbRight
    @player.go_up if button_down? Gosu::Button::KbUp
    @player.go_down if button_down? Gosu::Button::KbDown
  end
  
  def draw
    @player.draw
    @level.draw
  end
end


# start game
GameWindow.new.show