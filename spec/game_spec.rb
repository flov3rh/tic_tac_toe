# frozen_string_literal: true

require_relative '../lib/player_2.rb'
require_relative '../lib/game.rb'

RSpec.describe 'Game' do
  let(:flover) { Player.new(color: 'X', name: 'flover') }
  let(:christian) { Player.new(color: 'O', name: 'christian') }
  describe '#initialize' do
    it 'rendomly selects a current_player' do
      # Array.any_instance.stub(:shuffle) { [frank, bob] }
      allow_any_instance_of(Array).to receive(:shuffle).and_return(flover)
      game = Game.new([flover, christian])
      expect(game.current_player).to eq flover
    end

    it 'rendomly selects a current_player' do
      # Array.any_instance.stub(:shuffle) { [frank, bob] }
      allow_any_instance_of(Array).to receive(:shuffle).and_return(christian)
      game = Game.new([flover, christian])
      expect(game.current_player).to eq christian
    end
  end

  describe '#switch_player' do
    it 'will set @current_player to @other_player' do
      game = Game.new([flover, christian])
      other_player = game.other_player
      game.switch_players
      expect(game.current_player).to eq other_player
    end

    it 'will set @other_player to @current_player' do
      game = Game.new([flover, christian])
      current_player = game.current_player
      game.switch_players
      expect(game.other_player).to eq current_player
    end
  end

  describe '#solicit_move' do
    it 'ask the player to make a move' do
      game = Game.new([christian, flover])
      # allow(game).to  receive_message_chain(:current_player).and_return(christian)
      allow(game).to receive(:current_player).and_return(christian)
      expected = game.solicit_move.to_s
      expect(game.solicit_move).to eq expected
    end
  end

  describe '#get_move' do
    it "converts player_move of '1' to [0, 0]" do
      game = Game.new([flover, christian])
      expect(game.get_move('1')).to eq [0, 0]
    end

    it "converts player_move of '7' to [0, 0]" do
      game = Game.new([flover, christian])
      expect(game.get_move('7')).to eq [0, 2]
    end
  end

  describe '#game_over_message' do
    it "return '{current player name} won!' if board shows a winner" do
      game = Game.new([flover, christian])
      allow(game).to receive(:current_player).and_return(christian)
      allow(game.board).to receive(:game_over).and_return(:winner)
      expect(game.game_over_message).to eq 'christian won!'
    end

    it "return 'The game ended in a tie' if board shows a draw" do
      game = Game.new([flover, christian])
      allow(game).to receive(:current_player).and_return(christian)
      allow(game.board).to receive(:game_over).and_return(:draw)
      expect(game.game_over_message).to eq 'The game ended in a tie'
    end
  end
end
