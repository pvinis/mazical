class MainMenu
  include Menu

  def initialize
    puts "1"
    super(MAIN)
    @background = $images[:dark_background] ## na valo to background xoris transparent
    @title = "Mazical"
    @items = ["1P", "2P", "Options", "Quit"]
    p self
  end

  def button_down(id)
    super(id)
    if id == Gosu::Button::KbReturn
      case @selected
      when 0
        $window.start_game
      when 1
        #######
      when 2
        ##########
      when 3
        $window.quit
      end
    end
    $window.quit if id == Gosu::Button::KbEscape
  end
end
