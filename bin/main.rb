#!/usr/bin/env ruby

# frozen_string_literal: true

class Main
  attr_accessor :board

  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
    @moves=0
  end

  def print_header
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

  def game_start(one,two)
    while @moves<10
      print_board
      print_choice
      puts "#{one} select the position to play: "
      move_peg(gets.chomp,1)
      puts "#{two} select the position to play: "
      move_peg(gets.chomp,2)
    end
  end

  def move_peg(move,player)
    case player
      when 1
        @moves+=1
        @board[(move.to_i-1)]="X";
      when 2
        @moves+=1
        @board[(move.to_i-1)]="O";
    end
    print_board
    print_choice
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
  end
end

test = Main.new
test.print_header
