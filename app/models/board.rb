module Board
	attr_reader :board

 def board
    return @board if @board.present?
    @board = Array.new(8) { Array.new(8) }

    self.pieces.each do |p|
    x = p.x_position
    y = p.y_position
      @board[y][x] = p
    end
    return @board
  end
end

