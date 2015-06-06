class Pawn < Piece
  # scopes
  def self.type
    where(type: 'pawn')
  end

  def valid_move?(x, y, board)
  end
end
