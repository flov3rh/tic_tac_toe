# frozen_string_literal: true

# tiTacToe class for the game logic
class TicTacToe
  attr_reader :board, :moves, :player_one, :player_two, :turn

  def initialize(players, main, board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], moves = 0)
    # Initialize our board and game
    @board = board
    @game_over = false
    @moves = moves
    @player_one = Player.new(players[0])
    @player_two = Player.new(players[1])
    @turn = @player_one
    @main = main
    @winner=""
  end

  def start
    until @game_over
      # Players start playing
      move_peg(@main.player_in, @turn)
    end
  end

  # rubocop: disable Metrics/CyclomaticComplexity
  # rubocop: disable Metrics/PerceivedComplexity
  def move_peg(move, player)
    # Player move
    case player
    when @player_one
      if @board[(move.to_i - 1)] != 'X' && @board[(move.to_i - 1)] != 'O'
        @moves += 1
        @board[(move.to_i - 1)] = 'X'
        @game_over = check_win
        @turn = @player_two
      else
        move_peg(@main.player_in('Invalid Choice'), @turn)
      end
      system('clear')
    when @player_two
      if @board[(move.to_i - 1)] != 'X' && @board[(move.to_i - 1)] != 'O'
        @moves += 1
        @board[(move.to_i - 1)] = 'O'
        @game_over = check_win
        @turn = @player_one
      else
        move_peg(@main.player_in('Invalid Choice'), @turn)
      end
      system('clear')
    end
    if @game_over
      @main.print_winner(@winner.name)
    else
      @main.print_board
      @main.print_choice
    end
  end

  def all_equal?(arr)
    @winner=@turn
    arr.uniq.size <= 1 unless arr.all? { |x| x == " "}
  end

  def check_win
    # for rows
    all_equal?(board[0..2]) ||
    all_equal?(board[3..5]) ||
    all_equal?(board[6..8]) ||

    # for colums
    all_equal?([board[0], board[3], board[6]]) ||
    all_equal?([board[1], board[4], board[7]]) ||
    all_equal?([board[2], board[5], board[8]]) ||

    # for diagonals
    all_equal?([board[0], board[4], board[8]]) ||
    all_equal?([board[2], board[4], board[6]])
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name=name
  end
end
