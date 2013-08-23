class Rect
  attr_reader :x1, :x2, :y1, :y2

  def initialize(x1, x2, y1, y2)
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
  end

  def color
    Gosu::Color::WHITE
  end

  def draw(window)
    window.draw_quad(x1, y1, color, x2, y1, color, x2, y2, color, x1, y2, color)
  end
end
