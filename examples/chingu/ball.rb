class Ball < Chingu::GameObject
  SIZE = 20

  def initialize(*)
    super

    @x = 320
    @y = 240

    @dx = rand * 10
    @dy = rand * 10
  end

  def update
    @x += @dx
    if @x < 0 || @x > 640
      @dx *= -1
    end

    @y += @dy
    if @y < 0 || @y > 480
      @dy *= -1
    end
  end

  def draw
    rect = Chingu::Rect.new(@x - SIZE/2, @y - SIZE/2, SIZE, SIZE)
    $window.draw_rect(rect, Gosu::Color::RED, 0)
  end
end
