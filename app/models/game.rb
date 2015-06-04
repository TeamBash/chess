class Game < ActiveRecord::Base
  has_many :pieces
  delegate :rook, :queen, :king, :knight, :bishop, :pawn, to: :pieces

  # validates :must_have_both_users, :must_have_distinct_users
  validates :name, presence: :true, length: { minimum: 1 }

  belongs_to :white_user, class_name: 'User'
  belongs_to :black_user, class_name: 'User'
  belongs_to :next_user,  class_name: 'User'
  
  attr_accessor :black_user_email
  
  def end_turn
    if self.next_user == self.white_user
      self.next_user = self.black_user
    else
      self.next_user = self.white_user # sets white user first
    end
  end

  private

  def must_have_both_user
    return unless self.black_user.nil? && self.white_user.nil?
    self.errors.add(:base, 'must have two')
    return unless self.white_user.nil?
    self.errors.add(:white_user, 'must include the white user')
    return unless self.black_user.nil?
    self.errors.add(:black_user, 'must include the black user')
  end

  def must_have_distinct_users
    return unless self.white_user == self.black_user
    self.errors.add(:white_user, 'must be distinct from black_user')
  end

  def board
    board = Array.new(8) { Array.new(8) }

    # loop through pieces and populate board

    # return board as 2D array
    board
  end
end
