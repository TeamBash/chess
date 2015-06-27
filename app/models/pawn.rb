class Pawn < Piece
  # scopes
  def self.type
    where(type: 'pawn')
  end

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

  def capture_move?
    # LOGIC
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
