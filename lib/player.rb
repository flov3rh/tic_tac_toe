# frozen_string_literal: true

class Player
  attr_accessor :name, :color
  def initialize(input)
    @color = input.fetch(:color)
    @name = input.fetch(:name)
  end
end
