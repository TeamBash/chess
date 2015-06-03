class Pawn < Piece
  # scopes
  def self.type
    where(type: 'pawn')
  end
end
