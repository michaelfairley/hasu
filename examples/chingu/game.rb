require "chingu"
require "hasu"

Hasu.load "ball.rb"

class Game < Chingu::Window
  prepend Hasu::Guard

  def initialize
    super(640, 480, false)
    reset
  end

  def reset
    Ball.create
    Ball.create
  end
end

Game.new.show
