class Pawn < Piece
  # scopes
  def self.type
    where(type: 'pawn')
  end

  def valid_move?
  end
end
