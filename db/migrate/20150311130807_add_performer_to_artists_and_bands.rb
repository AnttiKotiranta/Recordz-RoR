class AddPerformerToArtistsAndBands < ActiveRecord::Migration
  def change
	create_table :artists_performers, id: false do |t|
	t.belongs_to :artist, index: true
        t.belongs_to :performer, index: true
	end
	create_table :bands_performers, id: false do |t|
	t.belongs_to :band, index: true
        t.belongs_to :performer, index: true
	end
  end
end
