class Queen < Piece
  # scopes
  def self.type
    where(type: 'queen')
  end
end
