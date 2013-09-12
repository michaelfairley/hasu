require 'gosu'
$:.unshift '../lib'
require 'hasu'
require './rect.rb'
Hasu.watch __FILE__

class Example < Hasu::Window
  prepend Hasu

  def initialize
    super(640, 480, false)
  end

  def reset
    @rect = Rect.new(10, 100, 10, 100)
  end

  def update
  end

  def draw
    @rect.draw(self)
  end
end

Example.run
