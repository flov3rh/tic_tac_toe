#!/usr/bin/env ruby

# frozen_string_literal: true

class Main
  attr_accessor :board

  def initialize(board = [0, 0, 0, 0, 0, 0, 0, 0, 0])
    @board = board
  end

  def print_header
    puts 'Welcome to tic tac toe'
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
    print_board
    print_choice
    puts "#{player_one} select the position to play: "
    puts "#{player_two} select the position to play: "
  end

  def print_board
    puts "---------------"
    puts " #{@board[0]} | #{@board[1]}  | #{@board[2]}  "
    puts "---------------"
    puts " #{@board[3]} | #{@board[4]}  | #{@board[5]}  "
    puts "---------------"
    puts " #{@board[6]} | #{@board[7]}  | #{@board[8]}  "
    puts "---------------"
  end

  def print_choice
    puts "1 | 2 | 3"
    puts "4 | 5 | 6"
    puts "7 | 8 | 9"
  end
end

test = Main.new
test.print_header
