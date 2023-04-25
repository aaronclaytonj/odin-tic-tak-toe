# frozen_string_literal: true

class Board
  attr_reader :cells, :game_over, :winner

  def initialize
    @cells = %w[1 2 3 4 5 6 7 8 9]
    @game_over = false
    @winner = nil
  end

  def update(currPlayer, num)
    if (num >= 1) && (num <= 9) && cells[num - 1].instance_of?(String)
      @cells[num - 1] = currPlayer.symbol
      @game_over = true if winning_move?
      @winner = currPlayer if game_over
      true
    else
      false
    end
  end

  def winning_move?
    horiz_win || vert_win || diag_win
  end

  def horiz_win
    ((cells[0] == cells[1] and cells[1] == cells[2]) and cells[0].instance_of?(Symbol)) or ((cells[3] == cells[4] and cells[4] == cells[5]) and cells[3].instance_of?(Symbol)) || ((cells[6] == cells[7] and cells[7] == cells[8]) and cells[6].instance_of?(Symbol))
  end

  def vert_win
    ((cells[0] == cells[3] and cells[3] == cells[6]) and cells[0].instance_of?(Symbol)) or ((cells[1] == cells[4] and cells[4] == cells[7]) and cells[1].instance_of?(Symbol)) || ((cells[2] == cells[5] and cells[5] == cells[8]) and cells[2].instance_of?(Symbol))
  end

  def diag_win
    ((cells[0] == cells[4] and cells[4] == cells[8]) and cells[0].instance_of?(Symbol)) or ((cells[2] == cells[4] and cells[4] == cells[6]) and cells[2].instance_of?(Symbol))
  end

  def full?
    if cells.any?(String)
      false
    else
      true
    end
  end

  def print_board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n---|---|----\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n---|---|----\n #{cells[6]} | #{cells[7]} | #{cells[8]}"
  end
end
