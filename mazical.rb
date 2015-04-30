# Mazical

class GameWindow < Gosu::Window
  $window_width = 960
  $window_height = 640
  STATES = [:play, :pause, :menu]

  attr_reader :state

  def initialize
    super($window_width, $window_height, false)
    $window = self
    self.caption = "Mazical"
    load_images
    @menu = MainMenu.new
    @pause = PauseMenu.new
    self.state = :menu
  end
  
  def load_images
    $images = {}
    $images[:white_background] = Gosu::Image.new($window, "./images/whitebackground.png")
    $images[:dark_background] = Gosu::Image.new($window, "./images/darkbackground.png")
    Wall.load_images
    Ball.load_images
  end

  def state=(to_state)
    puts "a"
    @state = to_state if STATES.include? to_state
  end

  def start_game
    self.state = :play
    @level = Grid.new.test_grid####
    @player = Ball.new(@level)
  end
  
  def pause_game
    self.state = :pause
  end

  def resume_game
    self.state = :play
  end

  def reset_level
    ########
  end

  def button_down(id)
    case @state
    when :play
      ###### kalitera etsi, i me case?
      @player.move_left if button_down? Gosu::Button::KbLeft ###button_down? i id == ?
      @player.move_right if button_down? Gosu::Button::KbRight
      @player.move_up if button_down? Gosu::Button::KbUp
      @player.move_down if button_down? Gosu::Button::KbDown
      @player.reset if button_down? Gosu::Button::KbR
      pause_game if button_down? Gosu::Button::KbP
      pause_game if button_down? Gosu::Button::KbEscape
    when :pause
      @pause.button_down id
    when :menu
      @menu.button_down id
    end
  end

  def draw
    case @state
    when :play
      draw_game
    when :pause
      @pause.draw
    when :menu
      @menu.draw
    end
  end

  def draw_game
    $images[:white_background].draw(0,0,Z::BACKGROUND)
    @level.draw
    @player.draw
  end

  def quit
    exit(0)
  end
end
