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
  
  def play
    self[0,0] = "J"
  end
  
  def move_piece(start_pos, end_pos)
    raise "there is no piece at #{start_pos}" if self[start_pos].nil?
    raise "the piece cannot move to #{end_pos}" unless self[end_pos].nil?
  end
end

class Piece 
  def initialize
    @piece = "H"
  end
end




if __FILE__ == $PROGRAM_NAME
  game = Board.new
  game.play
  game.move_piece([0,0],[0,1])
  
end