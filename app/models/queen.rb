class Queen < Piece  
  def valid_move?(x, y, board)
    x_pos = self.x_position
    y_pos = self.y_position
    
    # check to see if queen is moving irregularly
    # ie queen cannot move (0,3) => (4,4)
    # return false unless queen moves diagonially, vertically or horizontially 
    return false unless (x - x_pos).abs == (y - y_pos).abs || 
    x = x_pos && y != y_pos || x != x_pos && y = y_pos
    
    # checks if there are any obstructions between current position and destination
    if obstructed?(x, y, board)
      return false
    else
      return true
    end
  end
end


