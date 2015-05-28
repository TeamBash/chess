class Piece < ActiveRecord::Base
  belongs_to :game
  scope :black -> { where(color: "black") }
  scope :white -> { where(color: "white") }
end
