class AddImagesToPieces < ActiveRecord::Migration
  def change
  	add_column :pieces, :image_name, :string
  end
end
