class Pawn < Piece
  # scopes
  def self.type
    where(type: 'pawn')
  end

  def valid_move?(x, y, board)
    # do work here (overwrites inherited class method)
  end
end
