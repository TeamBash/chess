class King < Piece
  # scopes
  def self.type
    where(type: 'king')
  end

  def valid_move?(x, y, board)
    # not valid if King tries to move more than 1 square at a time
    return false if (self.x_position - x).abs > 1 || (self.y_position - y).abs > 1

    # checks if there are any obstructions between current position and destination
    if obstructed?(x, y, board)
      return false 
    else
      return true
    end
  end
end
