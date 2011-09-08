# Mazical

class GameWindow < Gosu::Window
  $window_width = 960
  $window_height = 640

  def initialize
    super($window_width, $window_height,false)
    self.caption = "Mazical"
    $window = self
    load_images
    @background = $images[:background]
    @level = Grid.new.test_grid####
    @player = Ball.new(@level)
  end
  
  def load_images
    $images = {}
    $images[:background] = Gosu::Image.new($window, "./images/whitebackground.png")
    Wall.load_images
    Ball.load_images
  end

  def button_down(id)
    ###### kalitera etsi, i me case?
    @player.move_left if button_down? Gosu::Button::KbLeft
    @player.move_right if button_down? Gosu::Button::KbRight
    @player.move_up if button_down? Gosu::Button::KbUp
    @player.move_down if button_down? Gosu::Button::KbDown
  end
  
  def draw
    $images[:background].draw(0,0,Z::BACKGROUND)
    @level.draw
    @player.draw
  end
end
