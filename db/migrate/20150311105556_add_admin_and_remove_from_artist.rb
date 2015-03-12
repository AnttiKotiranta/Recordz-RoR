class AddAdminAndRemoveFromArtist < ActiveRecord::Migration
  def change
	add_column :users, :admin, :boolean
	remove_column :artists, :string  
  end
end
