class AddNextUserToGames < ActiveRecord::Migration
  def change
    add_column :games, :next_user_id, :integer
  end
end
