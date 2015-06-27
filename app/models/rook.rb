class Rook < Piece
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # checks if a piece is moving only in a linear direction
    return false if x != x_pos && y != y_pos
    
    # Refer to obstructions.rb under linear_obstructed
    # checks if there are any obstructions between current position and destination
    if obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end