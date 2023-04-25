# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

game = Game.new
game.play

until gets.chomp.strip[0].downcase == "n"
  game = Game.new
  game.play
end
