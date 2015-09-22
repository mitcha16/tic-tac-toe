require 'minitest/autorun'
require 'minitest/pride'
require_relative 'human'

class HumanTest < Minitest::Test
  def test_it_has_a_symbol
    player = Human.new("X", "O")
    assert_equal "X", player.hum
  end

  def test_a_player_can_choose_a_spot
    player = Human.new("X", "O")
    assert_equal "X", player.get_human_spot(["1", "2"], 1)
  end
end
