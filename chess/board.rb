class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new(2) {Array.new(2)}
    @piece = Piece.new
    
  end
  
  def [](pos)
    x,y = pos
    @rows[x][y] 
  end  
  
  def []=(pos, val)
    x,y = pos
    @rows[x][y] = val
  end
  # 
  def play
    # pos = [0,0]
    self[[0,0]] = "A"
    self[[0,1]] = "B"
    self[[1,1]] = "C"
    self[[1,0]] = "D"
    
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






if __FILE__ == $PROGRAM_NAME
  game = Board.new
  game.play
  p game.rows
  game.move_piece([0,0],[1,1])
  p game.rows
  
end