# frozen_string_literal: true

require_relative '../lib/board.rb'

RSpec.describe 'Board' do
  describe '#initialize' do
    it 'it initializes the board with a grid' do
      expect { Board.new(grid: 'grid') }.to_not raise_error
    end

    it 'sets the grid with three rows by default' do
      board = Board.new
      expect(board.grid.size).to eq 3
    end

    it 'creates three thing in each row by default' do
      board = Board.new
      board.grid.each do |row|
        expect(row.size).to eq 3
      end
    end
  end

  describe '#grid' do
    it 'returns the grid' do
      board = Board.new(grid: 'jaja')
      expect(board.grid).to eq 'jaja'
    end
  end

  describe '#get_cell' do
    it 'returns the cell based ont the (x, y) cordinate' do
      grid = [['', '', ''], ['', '', 'something'], ['', '', '']]
      board = Board.new(grid: grid)
      expect(board.get_cell(2, 1)).to eq 'something'
    end
  end

  describe '#set_cell' do
    it 'updates the value of the cell object at a (x, y) coordinate' do
      Cat = Struct.new(:value)
      grid = [[Cat.new('cool'), '', ''], ['', '', ''], ['', '', '']]
      board = Board.new(grid: grid)
      board.set_cell(0, 0, 'meow')
      expect(board.get_cell(0, 0).value).to eq 'meow'
    end
  end

  describe '#game_over' do
    it 'returns :winner if winner? is true' do
      board = Board.new
      # board.stub(:winner?) {true}
      allow(board).to receive_message_chain(:winner?).and_return(true)
      expect(board.game_over).to eq :winner
    end
    it 'returns :draw if winner? is false and draw? is true' do
      board = Board.new
      allow(board).to receive_message_chain(:winner?).and_return(false)
      allow(board).to receive_message_chain(:draw?).and_return(true)
      # board.stub(:winner?) {false}
      # board.stub(:draw?) {true}
      expect(board.game_over).to eq :draw
    end

    it 'returns false if winner? is false and draw? is false' do
      board = Board.new
      allow(board).to receive_message_chain(:winner?).and_return(false)
      allow(board).to receive_message_chain(:draw?).and_return(false)
      # board.stub(:winner?) { false }
      # board.stub(:draw?) { false }
      expect(board.game_over).to be_falsey
    end
  end

  TestCell = Struct.new(:value)
  let(:x_cell) { TestCell.new('X') }
  let(:y_cell) { TestCell.new('Y') }
  let(:empty) { TestCell.new }

  describe '#game_over' do
    it 'returns :winner if winner? is true' do
      board = Board.new
      allow(board).to receive_message_chain(:winner?).and_return(true)
      # board.stub(:winner?) { true }
      expect(board.game_over).to eq :winner
    end

    it 'returns :draw if winner? is false and draw? is true' do
      board = Board.new
      allow(board).to receive_message_chain(:winner?).and_return(false)
      allow(board).to receive_message_chain(:draw?).and_return(true)
      # board.stub(:winner?) { false }
      # board.stub(:draw?) { true }
      expect(board.game_over).to eq :draw
    end

    it 'returns false if winner? is false and draw? is false' do
      board = Board.new
      allow(board).to receive_message_chain(:winner?).and_return(false)
      allow(board).to receive_message_chain(:draw?).and_return(false)
      # board.stub(:winner?) { false }
      # board.stub(:draw?) { false }
      expect(board.game_over).to eq false
    end

    it 'returns :winner when row has objects with values that are the same' do
      grid = [
        [x_cell, x_cell, empty],
        [y_cell, y_cell, y_cell],
        [y_cell, y_cell, empty]
      ]
      board = Board.new(grid: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :winner when columns has objects with values that are the same' do
      grid = [
        [x_cell, x_cell, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, empty]
      ]
      board = Board.new(grid: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :winner when diagonal has objects with values that are the same' do
      grid = [
        [x_cell, empty, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, x_cell]
      ]
      board = Board.new(grid: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :draw when all spaces are taken' do
      grid = [
        [x_cell, y_cell, x_cell],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, y_cell]
      ]
      board = Board.new(grid: grid)
      expect(board.game_over).to eq :draw
    end

    it 'returns false hwe there is no winner or draw' do
      grid = [
        [x_cell, empty, empty],
        [y_cell, empty, empty],
        [y_cell, empty, empty]
      ]
      board = Board.new(grid: grid)
      expect(board.game_over).to be_falsey
    end
  end
end
