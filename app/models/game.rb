class Game < ActiveRecord::Base
  has_many :pieces
  has_many :players, through: :user_games, source: :user
  has_many :user_games
  
  validate :must_have_both_players, :must_have_distinct_players
  
  def board
    board = Array.new(8) { Array.new(8) }
  
    # loop through pieces and populate board
  
    return board
  end
end
