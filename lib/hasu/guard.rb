module Hasu
  module Guard
    def initialize(*)
      super
      reset
    end

    def update(*)
      if Hasu.reload!
        Hasu.error = nil
      end
      unless Hasu.error
        super
      end
    rescue => e
      Hasu.error = e
    end

    def reset
      super  if defined?(super)
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
      case id
      when Gosu::KbEscape
        close
      when Gosu::Window.char_to_button_id('r')
        reset
      else
        begin
          super(id)
        rescue => e
          Hasu.error = e
        end
      end
    end
  end
end
