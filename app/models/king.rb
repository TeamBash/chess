class King < Piece
  # scopes
  def self.type
    where(type: 'king')
  end

  def valid_move?
  end
end
