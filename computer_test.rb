require 'minitest/autorun'
require 'minitest/pride'
require_relative 'computer'

class ComputerTest < Minitest::Test
  def test_it_knows_when_the_game_is_over
    computer = Computer.new("O", "X")
    assert_equal false, computer.game_is_over(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
  end
end
