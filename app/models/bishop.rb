class Bishop < Piece
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # checks the bishop moves only diagonally
    return false unless (x - x_pos).abs == (y - y_pos).abs
    
    # checks if there are any obstructions between current position and destination
    if obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end

# Bishop can only move diagonally. 
# Bishop is not restricted by distance. 