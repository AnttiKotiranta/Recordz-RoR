class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :string
      t.text :info

      t.timestamps
    end
  end
end
