class King < Piece
  # scopes
  def self.type
    where(type: 'king')
  end
end
