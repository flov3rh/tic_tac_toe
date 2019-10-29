# frozen_string_literal: true

require_relative '../lib/cell.rb'

RSpec.describe 'Cell' do
  describe '#initialize' do
    it "is instialized with a value of '' by default" do
      cell = Cell.new
      expect(cell.value).to eq ''
    end

    it "can be initialized with a value of 'x'" do
      cell = Cell.new('X')
      expect(cell.value).to eq 'X'
    end
  end
end
