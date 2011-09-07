class MainMenu
  def initialize
    @menu_items = ["1P", "2P", "Options", "Quit"]
    @selected = 0
  end
  
  def button_down(id)
    case id
    when Gosu::KbUp
      @selected = (@selected - 1) % @menu_items.size
    when Gosu::KbDown
      ##sound
      @selected = (@selected + 1) % @menu_items.size
    when Gosu::KbReturn
      case @selected
      when 0
        s
    