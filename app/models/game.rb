class Game < ActiveRecord::Base
  has_many :pieces
  has_many :game_users
  has_many :users, through: :game_users
  
  validate :must_have_both_players, :must_have_distinct_players
  
  belongs_to :white_player, class_name: "User", foreign_key: "white_user_id"
  belongs_to :black_player, class_name: "User", foreign_key: "black_user_id"
  belongs_to :next_player,  class_name: "User", foreign_key: "next_user_id"

  # keeps track of player turns
  def end_turn
    if self.next_player == self.white_player
      self.next_player = self.black_player
    else
      self.next_player = self.white_player # sets white player first
    end
  end
  
  private
  
  def must_have_both_players
    if users.size != 2
      errors.add(:users, "must have two")
    end
    if !users.member? white_player
      errors.add(:users, "must include the white player")
    end
    if !users.member? black_player
      errors.add(:users, "must include the black player")
    end
    if !users.member? next_player
      errors.add(:users, "must include the next player")
    end
  end

  def must_have_distinct_players
    if white_player == black_player
      errors.add(:white_player, "must be distinct from black_player")
    end
  end
  
  def board
    board = Array.new(8) { Array.new(8) }
  
    # loop through pieces and populate board
  
    return board
  end
end
