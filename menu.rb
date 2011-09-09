module Menu
  MAIN, PAUSE = *0..1

  def initialize(type)
    puts "2"
    @title_font = Gosu::Font.new($window, "helvetica", 100)
    @text_font = Gosu::Font.new($window, "Arial Black", 60)######
    @background = $images[:white_background]
    @title = ""
    @items = []
    @selected = 0
    @bgz,@z = case type
    when MAIN
      [Z::BACKGROUND, Z::MAIN_MENU]
    when PAUSE
      [Z::PAUSE_BACKGROUND, Z::PAUSE_MENU]
    end
    p self
  end

  def button_down(id)
    @selected = (@selected + 1) % @items.size if id == Gosu::Button::KbDown
    @selected = (@selected - 1) % @items.size if id == Gosu::Button::KbUp
  end

  def draw
##    @background.draw(0, 0, @bgz, 1, 1, 0x669977ff)
    color = Gosu::Color.new(0xff808080)
    $window.draw_quad(0, 0, color, $window_width, 0, color, 0, $window_height, color, $window_width, $window_height, color, @bgz, :multiply)
    @title_font.draw(@title, 20, 30, @z)
    @items.each_with_index do |item, i|
      if i == @selected
        @text_font.draw(item, 30, 100+i*60, @z, 1, 1, 0xFFFF8888)
      else
        @text_font.draw(item, 30, 100+i*60, @z, 1, 1, 0x88888888)
      end
    end
  end
end
