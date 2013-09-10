require "chingu"
require "hasu"
require "./ball.rb"

Hasu.watch __FILE__

class Game < Chingu::Window
  prepend Hasu::Guard

  def initialize
    super(640, 480, false)
    reset
  end

  def reset
    Ball.all.each(&:destroy)
    Ball.create
    Ball.create
  end
end

Game.new.show
