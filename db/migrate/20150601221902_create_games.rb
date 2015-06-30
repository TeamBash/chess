class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :white_user_id
      t.integer :black_user_id
      t.integer :next_user_id
      
      t.timestamps
    end
  end
end