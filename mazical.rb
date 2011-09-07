# Mazical

require 'gosu'
require './grid'
require './ball'
require './z'

class GameWindow < Gosu::Window
  def initialize
    super(960,640,false)
    self.caption = "Mazical"
    $window = self
    load_images
###    @grid = Grid.new
    @background = $images[:background]
    @level = Grid.new.test_grid####
    @player = Ball.new(@level)#######
  end
  
  def load_images
    $images = {}
    $images[:ball] = Gosu::Image.new($window, "./images/ball.png")
    $images[:left] = Gosu::Image.new($window, "./images/leftwall.png")
    $images[:right] = Gosu::Image.new($window, "./images/rightwall.png")
    $images[:top] = Gosu::Image.new($window, "./images/topwall.png")
    $images[:bottom] = Gosu::Image.new($window, "./images/bottomwall.png")
    $images[:background] = Gosu::Image.new($window, "./images/whitebackground.png")
  end

  def update
  end
  
  def button_down(id)
    @player.go_left if button_down? Gosu::Button::KbLeft
    @player.go_right if button_down? Gosu::Button::KbRight
    @player.go_up if button_down? Gosu::Button::KbUp
    @player.go_down if button_down? Gosu::Button::KbDown
  end
  
  def draw
    $images[:background].draw(0,0,Z::BACKGROUND)
    @level.draw
    @player.draw
  end
end


# start game
GameWindow.new.show