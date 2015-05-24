class Game < ActiveRecord::Base
  # has_many :players

  validates :name, presence: :true, length: { minimum: 1 }
end
