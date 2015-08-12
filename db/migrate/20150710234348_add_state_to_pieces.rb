class AddStateToPieces < ActiveRecord::Migration
  def change
  	add_column :pieces, :state, :string
  end
end
