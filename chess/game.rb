require_relative 'board'
require_relative 'display'
require_relative 'cursor'
require 'byebug'

class Game
  attr_reader :display,:cursor,:board
  def initialize
    @board = Board.new
    
    @display = Display.new(board)
  end

  def play 
    until game_over?
        take_turn
    end
  end
  
  def take_turn
    
    display.render
    puts ""
    display.cursor.get_input
  
  
  end
  
  def game_over?
    false
  end
  
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end 