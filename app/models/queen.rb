class Queen < Piece
  # scopes
  def self.type
    where(type: 'queen')
  end

  def valid_move?
  end
end