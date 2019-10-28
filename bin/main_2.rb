#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/game.rb"
require_relative "../lib/player_2.rb"

def main
  system("clear")
  puts "Welcome to tic tac toe"
  instructions
  # puts 'Player please select your name'
  # player_1 = gets.chomp()
  flover = Player.new(color: "X", name: "Flover")
  christian = Player.new(color: "O", name: "Christian")
  players = [flover, christian]
  Game.new(players).play
end

def instructions
  puts "--------------------INSTRUCTIONS----------------------"
  puts "To play this game, you need to get three in a row..."
  puts "Your choice are define, they must bef from 1 to 9..."
  puts "------------------------------------------------------"
end

main
