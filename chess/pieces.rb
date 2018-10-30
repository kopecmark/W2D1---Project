class Piece
  attr_reader :board
  
  def initialize(color,board,pos)
    @board = board
    @color = color
    @pos = pos 

  end
  
  def moves
  
  end
  

end

module SlidingPiece
  HORIZONTAL_DIRS = [[-1, 0], [0, -1], [0, 1], [1,0]].freeze
  DIAGONAL_DIRS = [[1,1],[-1,-1],[-1,1],[1,-1]].freeze
  
  def horizontal_dirs
    HORIZONTAL_DIRS
  end 
  
  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  
  def moves
    result = []
    # iterate through the avaliable move_dirs 
      # for every direction, pass that direction into grow_unblocked
      move_dirs.each do |el|
        result += grow_unblocked_moves_in_dir(el[0],el[1])
      end
      result
  end
  
  private
  def move_dirs
    diagonal_dirs+horizontal_dirs
  end
  
  def grow_unblocked_moves_in_dir(dx,dy)
    result = [@pos]
    (board.rows.size-1).times do 
      result << [result.last, [dx,dy]].transpose.map { |e|  e.reduce(:+) }
    end
    result
  end
end
  
  
  
end 

class Bishop < Piece
  include SlidingPiece
  
  def move_dirs
    horizontal_dirs #length 4
  end  
  
end

class Queen < Piece 
  include SlidingPiece
  
  def move_dirs
    horizontal_dirs + diagonal_dirs # length 8
  end  
  
  def grow_unblocked(dx, dy)
    
  end 
end 


