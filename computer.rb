require_relative 'game_methods'

class Computer
  attr_reader :com, :hum
  include GameMethods

  def initialize(computer_symbol, human_symbol)
    @com = computer_symbol
    @hum = human_symbol
  end

  def get_computer_spot(board)
    @board        = board
    computer_spot = eval_board
    puts "Your opponent chose spot number #{computer_spot}.\n"
  end

  def eval_board
    spot = nil
    until spot
      if @board[4] == "4"
        spot         = 4
        @board[spot] = com
      else
        spot = get_best_move(@board, com)
        if @board[spot] != hum && @board[spot] != com
          @board[spot] = com
        end
      end
    end
    spot
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = get_available_spots(board)
    available_spaces.each do |as|
      board[as.to_i] = com
      if game_is_over(board)
        game_over_logic(board, as)
      else
        board[as.to_i] = hum
        if game_is_over(board)
          game_over_logic(board, as)
        else
          board[as.to_i] = as
        end
      end
    end
    check_for_best_move(best_move ||= nil, available_spaces)
  end

  def game_over_logic(board, as)
    best_move      = as.to_i
    board[as.to_i] = as
    best_move
  end

  def check_for_best_move(best_move, available_spaces)
    if !best_move
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
    best_move
  end

  def get_available_spots(board)
    board.select do |s|
      s != hum && s != com
    end
  end
end
