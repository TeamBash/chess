class Knight < Piece
  # scopes
  def self.type
    where(type: 'knight')
  end
end
