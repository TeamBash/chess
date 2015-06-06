module Obstructions
  def same_color?(a_piece)
    # if a piece is present and of the same color returns true
    !a_piece.nil? && (a_piece.piece_color == self.piece_color)
  end

  def destination_obstructed(x, y, board)
    # determines what is at a destination x, y coordinate
    destination = board[x][y]

    # determines if destination is occupied by a piece of the same color
    same_color?(destination) ? nil : destination
  end

  def linear_obstructed(x, y, board)
    # stores current position in variables for incrementations
    x_pos = self.x_position
    y_pos = self.y_position

    if x == x_pos # piece is moving vertically
      # work out direction of incrementation
      y_increment = y > y_pos ? 1 : -1
      y_pos += y_increment

      while (y - y_pos).abs > 0
        current_sq = board[x_pos][y_pos]

        unless current_sq.nil?
          # hit something, return the first obstruction
          return current_sq
        end

        y_pos += y_increment
      end
    elsif y == y_pos # piece is moving horizontally
      # work out direction of incrementation
      x_increment = x > x_pos ? 1 : -1
      x_pos += x_increment

      while (x - x_pos).abs > 0
        current_sq = board[x_pos][y_pos]

        unless current_sq.nil
          # hit something, return the first obstruction
          return current_sq
        end

        x_pos += x_increment
      end
    end
    # no obstructions return nil
    nil
  end

  def diagonal_obstructed(x, y, board)
    # stores current position in variables for incrementations
    x_pos = self.x_position
    y_pos = self.y_position

    if x == x_pos || y == y_pos
      # piece is not moving diagonally
      return nil
    end

    # determine horizontal and vertical increment values
    x_increment = x > x_pos ? 1 : -1
    y_increment = y > y_pos ? 1 : -1

    x_pos += x_increment
    y_pos += y_increment

    # loop through all values stopping before x, y
    while (x - x_pos).abs > 0 && (y - y_pos).abs > 0
      current_sq = board[x_pos][y_pos]

      unless current_sq.nil?
        # hit something, return the first obstruction
        return current_sq
      end

      x_pos += x_increment
      y_pos += y_increment
    end
    # no obstructions return nil
    nil
  end
end
