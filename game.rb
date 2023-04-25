# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require 'pry-byebug'

class Game
  attr_reader :player1, :player2, :board, :currPlayer

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @currPlayer = nil
  end

  def play
    @board.print_board
    game_setup
    player_turns
    conclusion
  end

  def conclusion
    if board.winner
      puts "#{board.winner.name} wins!!!! Play again?"
    else
      puts "Tie game, Play again?"
    end
  end

  def game_setup
    puts('Player 1 - Please enter your name!')
    @player1 = create_player('aaron', :A)
    puts('Player 2 - Please enter your name!')
    @player2 = create_player('bob', :B)
  end

  def player_turns
    @currPlayer = player1
    loop do
      turn(currPlayer)
      break if board.game_over
      break if board.full?
      board.print_board
      @currPlayer = switch
      
    end
  end

  def turn(currPlayer)
    puts 'Please enter a number on the board!'
    input = gets.chomp.to_i
    until @board.update(currPlayer, input)
      puts 'Invalid input'
      input = gets.chomp.to_i
    end
  end

  def switch
    if currPlayer == player1
      player2
    else
      player1
    end
  end

  def create_player(name, sym)
    # name = gets.chomp
    # puts 'Please enter a symbol you would like to use!'
    # symbol = gets.chomp.strip[0].to_sym
    player = Player.new(name, sym)
  end
end
