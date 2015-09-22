class Human
  attr_reader :hum, :other

  def initialize(human_symbol, other_symbol)
    @hum = human_symbol
    @other = other_symbol
  end

  def get_human_spot(board, spot = gets.chomp.to_i)
    if board[spot] != hum && board[spot] != other && board[spot]
      board[spot] = hum
    else
      puts "Please select a valid spot."
      get_human_spot(board)
    end
  end
end
