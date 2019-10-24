# frozen_string_literal: true

require_relative '../lib/tic_tac_toe.rb'
# require_relative '../bin/main.rb'

RSpec.describe 'TicTacToe' do
  let(:game) { TicTacToe.new(["player1","player2"],nil,["X","X","X","O", "X", "O","X","O"],9)}
  let(:game_draw) { TicTacToe.new(["player1","player2"],nil,["X","O","X","X","X","O","O","X","O"],9)}

# ["X","O","X",
#  "X","X","O",
#  "O","X","O"]


  it "check if there is winner" do
    expect(game.check_win?).to eq(true)
  end

  it "check if there is a draw" do
    expect(game_draw.check_win?).not_to eq(false)
  end


end
