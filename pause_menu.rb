class PauseMenu
  include Menu

  def initialize
    super(PAUSE)
    @background = $images[:dark_background] ## na valo to background xoris transparent
    @title = "Pause"
    @items = ["Resume (Esc)", "Reset (R)", "Options", "Main Menu"]
  end

  def button_down(id)
    super(id)
    $window.resume_game if id == Gosu::Button::KbEscape
    $window.reset_level if id == Gosu::Button::KbR
    if id == Gosu::Button::KbReturn
      case @selected
      when 0
        $window.resume_game
      when 1
        $window.reset_level
      when 2
        ##########
      when 3
        $window.state = :menu
      end
    end
  end
  
  def draw
    $window.draw_game
    super
  end
end
