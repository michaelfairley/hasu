module Hasu
  module Guard
    def update(*)
      super
    rescue => e
      Hasu.error = e
    end

    def reset
      super if defined?(super)
      Hasu.window = self unless Hasu.window
      Hasu.error = nil
    rescue => e
      Hasu.error = e
    end

    def draw(*)
      if Hasu.error
        ([Hasu.error.inspect] + Hasu.error.backtrace).each_with_index do |line, i|
          _hasu_font.draw(line.gsub("\n",''), 10, 10 + i * 16, 0)
        end
      else
        begin
          super
        rescue => e
          Hasu.error = e
          draw
        end
      end
    end

    def _hasu_font
      @_hasu_font ||= Gosu::Font.new(self, Gosu::default_font_name, 16)
    end

    def button_down(id)
      if id == Gosu::KbR
        reset
      else
        super(id)
      end
    end
  end
end
