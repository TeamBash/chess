class Knight < Piece
  # scopes
  def self.type
    where(type: 'knight')
  end
  
  def valid_move?(x, y, board)
  end
end
