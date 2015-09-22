require_relative 'human'
require_relative 'computer'
require_relative 'game_methods'

class Game
  attr_accessor :board
  attr_reader   :com, :hum
  include GameMethods

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @com   = "X"
    @hum   = "O"
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    puts "Which game type would you like to play?"
    puts "Choose 'human vs human' or 'human vs computer'!"
    choice = gets.chomp
    if choice == "human vs human"
      play_vs_human
    else
      play_vs_computer
    end
    "Game over"
  end

  def play_vs_computer
    player   = Human.new(hum, com)
    computer = Computer.new(com, hum)
    show_board
    until game_is_over(board) || tie(board)
      puts "Please select your spot."
      player.get_human_spot(board)
      show_board
      computer.get_computer_spot(board) if !game_is_over(board) && !tie(board)
      puts "The current board is..."
      show_board
    end
  end

  def play_vs_human
    player   = Human.new("O", "X")
    player2  = Human.new("X", "O")
    show_board
    until game_is_over(board) || tie(board)
      puts "Please select your spot."
      player.get_human_spot(board)
      show_board
      player2.get_human_spot(board)
      puts "The current board is..."
      show_board
    end
  end

  private

  def show_board
    puts "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n"
  end
end

if __FILE__ == $0
  game = Game.new
  puts game.start_game
end
