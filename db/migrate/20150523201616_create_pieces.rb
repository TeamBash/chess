class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string, :piece_type
      t.string, :piece_color
      t.integer, :x_position
      t.integer, :y_position
      t.integer :game_id

      t.timestamps
    end
  end
end
