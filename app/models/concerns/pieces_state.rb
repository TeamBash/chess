module PiecesState
	extend ActiveSupport::Concern

  def pieces_on_board(color)
    self.pieces.where(color: color).where(state: nil)
  end

  def pieces_captured(color)
    self.pieces.where(state: 'captured')
  end
end