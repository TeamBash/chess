class Rook < Piece
  # scopes
  def self.type
    where(type: 'rook')
  end

  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # Refer to obstructions.rb under linear_obstructed
    # checks if a piece is moving diagonally
    return false if x != x_pos && y != y_pos
    
    # checks if there are any obstructions between current position and destination
    if self.obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end