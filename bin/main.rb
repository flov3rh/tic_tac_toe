#!/usr/bin/env ruby

# frozen_string_literal: true

class Main
  attr_accessor :board

  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    #Initialize our board and game
    @board = board
    @moves=0
    @winner=false
  end

  def print_header
    #player instructions
    puts " "
    puts 'Welcome to tic tac toe'
    puts " "
    puts '--------------------INSTRUCTIONS----------------------'
    puts 'To play this game, you need to get three in a row...'
    puts 'Your choice are define, they must bef from 1 to 9...'
    puts '------------------------------------------------------'
    puts 'Please provide player one name: '
    player_one = gets.chomp()
    puts 'Please provide player two name: '
    player_two = gets.chomp()
    puts '**************************************************************'
    puts "Player one X is #{player_one} vs Player two O is #{player_two}"
    puts '**************************************************************'
    puts "This is the positions players can choose"
    game_start(player_one,player_two)
  end

  def player_in(player)
    #Player input
    input=nil
    until input
      input=gets.chomp.to_i
      case input
        when 1..9
          #input range
        else
          puts "invalid choice"
          input = nil
      end
    end
    move_peg(input,player)
  end

  def game_start(one,two)
    until @winner
      #Players start playing
      print_board
      print_choice
      puts "#{one} select the position to play: "
      player_in(1)
      break if @winner
      puts "#{two} select the position to play: "
      player_in(2)
      break if @winner
    end
  end

  def move_peg(move,player)
    #Player move
    case player
      when 1
        if @board[(move.to_i-1)] != "X" || @board[(move.to_i-1)] != "O"
          @moves+=1
          @board[(move.to_i-1)]="X"
        else
          puts "invalid choice"
          player_in(1)
        end
        system("clear")
      when 2
        if @board[(move.to_i-1)] != "X" || @board[(move.to_i-1)] != "O"
          @moves+=1
          @board[(move.to_i-1)]="O";
        else
          puts "invalid choice"
          player_in(2)
        end
        system("clear")        
    end
    @winner=check_winner
    if @winner
      puts "game over"
    else
      print_board
      print_choice
    end
  end

  def check_winner
    #Game finishes after 9 moves
    @moves==9
  end

  def print_board
    puts " "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts " "
  end

  def print_choice
    puts "1 | 2 | 3"
    puts "4 | 5 | 6"
    puts "7 | 8 | 9"
    puts "moves: #{@moves}"
    puts " "
  end
end

test = Main.new
test.print_header
