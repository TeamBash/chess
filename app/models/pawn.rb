class Pawn < Piece
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position

    # cannot move horizontally
    return false if y_pos == y
    
    # cannot move backwards
    return false if (self.color == 'black' && y_pos - y > 0)
    return false if (self.color == 'white' && y_pos - y < 0)
    
    # if it's the first move, checks if it's hopping too much
    if self.first_move
      # if first move, can move two spaces forward but not diagonally
      return false if (y_pos - y).abs > 2
    else
      # cannot move more than one spot
      return false if (y_pos - y).abs > 1
    end

    unless capture_move?(x, y) || x_pos == x
      # checks if there are any obstructions at destination square only
      if obstructed?(x, y, board)
        return false
      else
        return true
      end
    end
  end

  def capture_move?(x, y)
    # not a capture move if moving vertically
    return false if (self.x_position == x)
    # cannot capture a piece more than a square away
    return false if (self.x_position - x).abs > 1 || (self.y_position - y).abs > 1
    # otherwise returns true
    return true
  end

  def en_passant?(y)
    y_direction = (y - self.y_position).abs
    if self.first_move
      true
    elsif (y_direction == 1 || y_direction == 2)
      true
    else
      false
    end
  end

  # def first_move?
  #   (y_pos == 1 && color == white) || (y_pos == 6 && color == black)
  # end
end
