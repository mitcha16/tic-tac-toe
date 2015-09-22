require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class GameTest < Minitest::Test
  def test_it_has_a_board
    game = Game.new
    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8"], game.board
  end

  def test_a_player_can_win_a_game
    game = Game.new
    game.board = ["X", "X", "X", "3", "4", "5", "6", "7", "8"]
    assert_equal "Game over", game.start_game
  end
end
