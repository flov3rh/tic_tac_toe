#!/usr/bin/env ruby

# frozen_string_literal: true

require './lib/tic_tac_toe.rb'

class Main

   attr_reader :player_in, :print_board, :print_choice

  def initialize()
    #Create instance of our game
    @players=names_in
    @game=TicTacToe.new(@players,self)
    welcome
  end

  def welcome
    #player instructions
    system("clear")
    puts '--------------------INSTRUCTIONS----------------------'
    puts 'To play this game, you need to get three in a row...'
    puts 'Your choice are define, they must bef from 1 to 9...'
    puts '------------------------------------------------------'
    puts '**************************************************************'
    puts "Player one X is #{@game.player_one.name} vs Player two O is #{@game.player_two.name}"
    puts '**************************************************************'
    puts "These are the positions players can choose"
    print_choice
    @game.start
  end

  def names_in
    result = []
    puts " "
    puts 'Welcome to tic tac toe'
    puts " "
    puts 'Please provide player one name: '
    result << gets.chomp()
    puts 'Please provide player two name: '
    result <<  gets.chomp()
    system("clear")
    result
  end

  def player_in(invalid_choice=nil)
    #Player input
    puts invalid_choice if invalid_choice

    input=nil
    until input
      puts "Please select your move #{@game.turn.name}"
      input=gets.chomp.to_i
      case input
        when 1..9
          #input range
        else
          puts "invalid choice"
          input = nil
      end
    end
    return input
  end

  def print_board
    puts " "
    puts " #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]}"
    puts "-----------"
    puts " #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]}"
    puts "-----------"
    puts " #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]}"
    puts " "
  end

  def print_choice
    puts "1 | 2 | 3"
    puts "4 | 5 | 6"
    puts "7 | 8 | 9"
    puts "moves: #{@game.moves}"
    puts " "
  end

  def print_winner(player)
    print_board
    puts "Player #{player.name} won!" unless player == "DRAW"
    print_draw if player == "DRAW"
  end

  def print_draw
    puts "It's a DRAW!!"
  end

end

test = Main.new
