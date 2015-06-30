class Knight < Piece  
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # check if piece is moving only in linear direction
    return false if x == x_pos || y == y_pos
    
    # check if knight is moving the right amount of squares in L-shape
    return false unless (x - x_pos).abs == 1 && (y - y_pos).abs == 2 || (y - y_pos).abs == 1 && (x - x_pos).abs == 2
    
    # checks if there are any obstructions at destination square only
    if destination_obstructed(x, y, board).nil?
      return false
    else
      return true
    end
  end
end
