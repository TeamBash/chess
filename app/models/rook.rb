class Rook < Piece
  # scopes
  def self.type
    where(type: 'rook')
  end
end
