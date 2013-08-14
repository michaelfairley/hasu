require "gosu"
require "hasu/guard"

module Hasu
  class Window < Gosu::Window
    def self.inherited(other)
      includer = caller.first.split(":").first
      Hasu.reloads[includer] = File.mtime(includer)
      other.send(:prepend, Hasu::Guard)
    end

    def self.run
      unless @running
        @running = true
        new.show
      end
    end
  end
end
