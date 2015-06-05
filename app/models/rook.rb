class Rook < Piece
  # scopes
  def self.type
    where(type: 'rook')
  end

  def valid_move?
  end
end