class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  
  #scopes
  def self.black
    where(piece_color: 'black')
  end
  
  def self.white
    where(piece_color: 'white')
  end
  
  # include obstructions for obstruction checks
  include Obstructions
  
  def is_obstructed(x, y, board)
    # checks if destination is obstructed
    capturable = destination_obstructed?(x, y, board)
    return true if capturable.nil?
    # checks if destination is blocked diagonally
    capturable = diagonal_line_obstructed(x, y, board)
    return true if capturable.nil?
    # checks if destination is blocked vertically or horizontally
    capturable = straight_line_obstructed(x, y, board)
    return true if capturable.nil?
  end
end
