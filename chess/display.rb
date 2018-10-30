require 'byebug'
require 'colorize'
require_relative 'cursor'
require_relative 'board'
class Display
  attr_reader :board, :cursor
  
  def initialize #remove board after test
    @cursor = Cursor.new([0,0], board)
    # @board = board
  end
  
  def render
    current = cursor.cursor_pos
    board.rows.each_with_index do |row,row_idx|
      row.each_with_index do |col,col_idx|
        pos = [row_idx,col_idx]
        if current == [row_idx,col_idx]
          puts col.colorize(background: :blue)
        else
          puts col
        end
      end
      puts 
    end
  end
  
  def play 
    render
    cursor.get_input
    render
  end
end
  

board = Board.new
board.play
display = Display.new(board)
display.play
