# frozen_string_literal: true

require_relative 'board.rb'

class Game
  attr_reader :players, :board, :current_player, :other_player

  def initialize(players, board = Board.new)
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def solicit_move
    "#{current_player.name}: Enter a number between 1 and 9 to make your move"
  end

  def get_move(player_move)
    player_move_to_coordinate(player_move)
  end

  def game_over_message
    return "#{current_player.name} won!" if board.game_over == :winner
    return 'The game ended in a tie' if board.game_over == :draw
  end

  def play
    puts "#{current_player.name} has randomly been selected as the first player"
    loop do
      board.formatted_grid
      puts ''
      puts solicit_move
      player_move = gets.chomp
      next unless move_valid?(player_move)

      x, y = get_move(player_move)
      board.set_cell(x, y, current_player.color)

      if board.game_over
        puts game_over_message
        board.formatted_grid
        return
      else
        system('clear')
        switch_players
      end

      # if board.game_over
      #   puts game_over_message
      #   board.formatted_grid
      #   return
      # else
      #   switch_players
      # end
    end
  end

  def move_valid?(player_move)
    result = false

    case player_move.to_i
    when 1..9
      result = true
      p = player_move_to_coordinate(player_move)
      puts board.get_cell(p[0], p[1]).value
      if board.get_cell(p[0], p[1]).value == ''
        result = true
      else
        puts "It's taken"
        result = false
      end
    else
      puts 'Invalid move!'
      result = false
    end
    result
  end

  private

  def player_move_to_coordinate(player_move)
    mapping = {
      '1' => [0, 0],
      '2' => [1, 0],
      '3' => [2, 0],
      '4' => [0, 1],
      '5' => [1, 1],
      '6' => [2, 1],
      '7' => [0, 2],
      '8' => [1, 2],
      '9' => [2, 2]
    }

    mapping[player_move]
  end
end
