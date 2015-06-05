class Bishop < Piece
  # scopes
  def self.type
    where(type: 'bishop')
  end

  def valid_move?
  end
end