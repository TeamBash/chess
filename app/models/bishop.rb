class Bishop < Piece
  # scopes
  def self.type
    where(type: 'bishop')
  end

  def valid_move?(x, y, board)
  end
end
