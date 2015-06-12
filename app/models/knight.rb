class Knight < Piece
  # scopes
  def self.type
    where(type: 'knight')
  end
  
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # check if piece is moving only in linear direction
    return false if x == x_pos || y == y_pos
    
    # check if knight is moving the right amount of squares in L-shape
    return false unless (x - x_pos).abs == 1 && (y - y_pos).abs == 2 || (y - y_pos).abs == 1 && (x - x_pos).abs == 2
    
    # checks if there are any obstructions between current position and destination
    if self.obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end
