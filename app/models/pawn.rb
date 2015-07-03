class Pawn < Piece
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position

    # cannot move backwards
    return false if (color == black && (self.y_pos - y).abs < y) || (color == white && (self.y_pos - y).abs > y)

    # cannot move horizontally except to capture
    if capture_move?
      # then it's cool to move diagonally one space
      return false if (self.x_pos - x).abs > 1
    else
      # it's not cool to move horizontally
      return false if (self.x_pos - x).abs > x
    end

    # if it's the first move, checks if it's hopping too much
    if first_move?
      # if first move, can move two spaces forward but not diagonally
      return false if (self.y_pos - y).abs > 2
    else
      # cannot move more than one spot
      return false if (self.y_pos - y).abs > 1
    end

    # checks if there are any obstructions at destination square only
    if destination_obstructed(x, y, board).nil?
      return false
    else
      return true
    end
  end

  def capture_move?(x, y)
    x_direction = (x_pos - x).abs
    y_direction = (y_pos - y).abs

    capturable_piece = destination_obstructed(x, y)

    # can't capture same-color pieces
    return false if capturable_piece.color == self.color
    # should move there instead of capturing
    return false if capturable_piece.blank?
    # can only capture things one tile away,
    # this might be redundant
    return false if x_direction > 1 && y_direction > 1
  end

  def en_passant?(y)
    y_direction = (y - y_pos).abs
    if first_move?
      true
    elsif (y_direction == 1 || y_direction == 2)
      true
    else
      false
    end
  end

  def first_move?
    (y_pos == 1 && color == white) || (y_pos == 6 && color == black)
  end
end
