class UserGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  
    
  belongs_to :white_player, class_name: "User", foreign_key: "white_user_id"
  belongs_to :black_player, class_name: "User", foreign_key: "black_user_id"
  belongs_to :next_player, class_name: "User", foreign_key: "next_user_id"

  def end_turn
    if self.next_player == self.white_player
      self.next_player = self.black_player
    else
      self.next_player = self.white_player
    end
  end
  
  private
  
  def must_have_both_players
    if players.size != 2
      errors.add(:players, "must have two")
    end
    if !players.member? white_player
      errors.add(:players, "must include the white player")
    end
    if !players.member? black_player
      errors.add(:players, "must include the black player")
    end
    if !players.member? next_player
      errors.add(:players, "must include the next player")
    end
  end

  def must_have_distinct_players
    if white_player == black_player
      errors.add(:white_player, "must be distinct from black_player")
    end
  end
end