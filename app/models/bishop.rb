class Bishop < Piece
  # scopes
  def self.type
    where(type: 'bishop')
  end
end
