class Game < ActiveRecord::Base
  belongs_to :white_user, class: :User, foreign_key: :'white_user_id'
  belongs_to :black_user, class: :User, foreign_key: :'black_user_id'
  has_many :pieces
end
