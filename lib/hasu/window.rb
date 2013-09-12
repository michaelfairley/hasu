require "gosu"
require "hasu/guard"

module Hasu
  class Window < Gosu::Window
    def self.inherited(other)
      if other.respond_to?(:prepend, true)
        other.send(:prepend, Hasu::Guard)
      else
        warn "Most of Hasu's nifty features (e.g. error catching, file reloading) are only available on Ruby >= 2.0."
      end
    end

    def initialize(*)
      super
      reset unless Hasu.error
    end

    def self.run
      unless @running
        @running = true
        new.show
      end
    end
  end
end
