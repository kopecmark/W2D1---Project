require 'byebug'
require 'colorize'
require_relative 'cursor'
require_relative 'board'
class Display
  attr_reader :board, :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    current = cursor.cursor_pos
    idx = 0 
    board.rows.each_with_index do |row,row_idx|
      row.each_with_index do |col,col_idx|
        pos = [row_idx,col_idx]
        if current == [row_idx,col_idx]
          # debugger
          print board[pos].symbol.colorize(background: :blue)
        elsif idx.even?
          print board[pos].symbol.colorize(background: :white)
        elsif idx.odd?
          print board[pos].symbol.colorize(background: :black)
        end
        idx+=1
      end
      idx+=1
      puts ""
      # pos=[0,1]
      # p board[pos].moves
    end
  end
  
  def play 
    render
    cursor.get_input
    puts ""
    render
  end
  
end
  
if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.play
end 