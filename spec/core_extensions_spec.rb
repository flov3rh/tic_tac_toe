# frozen_string_literal: true

require_relative '../lib/core_extensions.rb'

RSpec.describe 'Array' do
  describe '#all_empty' do
    it 'returns true if all elements fo the Array are empty' do
      expect(['', '', ''].all_empty?).to be_truthy
    end

    it 'return false if some of the Array elemts are not empty' do
      expect(['', 1, '', Object.new, :a].all_empty?).to be_falsey
    end
  end

  describe '#all_same?' do
    it 'return true if all elements of the Array are the same' do
      expect(%w[A A A].all_same?).to be_truthy
    end

    it 'return false if some elements of the Array are not the same' do
      expect(['', 'A', '', Object.new, :b].all_same?).to be_falsey
    end

    it 'return true for an empty Array' do
      expect([].all_same?).to be_truthy
    end
  end

  describe '#any_empty?' do
    it 'return true if any elements of the array are empty' do
      expect([''].any_empty?).to be_truthy
    end

    it 'return false if any elements of the array is not empty' do
      expect(['A'].any_empty?).to be_falsey
    end
  end

  describe '#none_empty?' do
    it 'return true if none of the elements are empty' do
      expect([['']].none_empty?).to be_truthy
    end

    # it "return false if none of the elements are not empty" do
    #   expect([[]].none_empty?).to be_falsey
    # end
  end
end
