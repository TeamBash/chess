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

#	  a b c d e f g h
# 1 r N b k q b N r 
# 2 p p p p p p p p black
# 3 0 0 0 0 0 0 0 0
# 4 0 0 0 0 0 0 0 0
# 5 0 0 0 0 0 0 0 0
# 6 0 0 0 0 0 0 0 0
# 7 p p p p p p p p white
# 8 r N b q k b N r 

#	  1 2 3 4 5 6 7 8
# 1 r N b k q b N r 
# 2 p p p p p p p p black
# 3 0 0 0 0 0 0 0 0
# 4 0 0 0 0 0 0 0 0
# 5 0 0 0 0 0 0 0 0
# 6 0 0 0 0 0 0 0 0
# 7 p p p p p p p p white
# 8 r N b q k b N r 

# If know what pieces are moving and all the other pieces on the board
# Then we can tell if the pieces is obstructed or can move there

# If I know all the @game.pieces in the game
# What piece is moving to
# What square it's moving to 

# Whether the piece is able to move there

# Could a piece move there on a blank board?

# R a4 => d6 #=> false

#	  a b c d e f g h
# 1 r N b k q b N r 
# 2 p p p p p p p p black
# 3 0 0 0 0 0 0 0 0
# 4 r 0 0 0 0 0 0 0
# 5 0 0 0 0 0 0 0 0
# 6 0 0 0 r 0 0 0 0
# 7 p p p p p p p p white
# 8 r N b q k b N r 

# Can the piece move to every square between where it is and where it's moving? 

# b b4 => d6, but there's a pawn on c5 #=> false
