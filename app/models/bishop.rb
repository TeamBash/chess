class Bishop < Piece
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # not valid if the bishop moves horizonally or vertically
    return false if x == x_pos || y == y_pos
    
    # checks if there are any obstructions between current position and destination
    if self.obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end

# Bishop can only move diagonally. 
# Bishop is not restricted by distance. 