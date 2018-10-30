require 'byebug'
require_relative 'pieces'

class Board
  attr_reader :rows
  
  
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @null = NullPiece.new
    populate_board
  end
  
  def [](pos)
    x,y = pos
    @rows[x][y] 
  end  
  
  def []=(pos, val)
    x,y = pos
    @rows[x][y] = val
  end 
  
  def populate_board
    # debugger
    rows.each_with_index do |el,row|
      el.each_with_index do |c,col|
        pos = [row,col]
        self[pos] = @null
      end
    end 
    pos = [0,1]
    self[pos] = Bishop.new
  end
  
  def move_piece(start_pos, end_pos)
    raise "there is no piece at #{start_pos}" if self[start_pos].nil?
    raise "the piece cannot move to #{end_pos}" unless self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end
  
  def valid_pos?(pos)
    size = rows.length
    return false if pos[0] < 0 || size < pos[0] || size < pos[1] || 0 > pos[1]
    true
  end

end




