class Game < ActiveRecord::Base
  has_many :pieces

  # validates :must_have_both_users, :must_have_distinct_users
  validates :name, presence: :true, length: { minimum: 1 }

  belongs_to :white_user, class_name: "User", foreign_key: "white_user_id"
  belongs_to :black_user, class_name: "User", foreign_key: "black_user_id"
  belongs_to :next_user, class_name: "User", foreign_key: "next_user_id"

  def end_turn
    if self.next_user == self.white_user
      self.next_user = self.black_user
    else
      self.next_user = self.white_user # sets white user first
    end
  end

  private

  def must_have_both_user
    if users.size != 2
      errors.add(:users, "must have two")
    end
    if !users.member? white_user
      errors.add(:users, "must include the white user")
    end
    if !users.member? black_user
      errors.add(:users, "must include the black user")
    end
    if !users.member? next_user
      errors.add(:users, "must include the next user")
    end
  end

  def must_have_distinct_users
    if white_user == black_user
      errors.add(:white_user, "must be distinct from black_user")
    end
  end

  def board
    board = Array.new(8) { Array.new(8) }

    # loop through pieces and populate board

    return board
  end
end


