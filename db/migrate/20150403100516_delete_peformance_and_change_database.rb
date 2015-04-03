class DeletePeformanceAndChangeDatabase < ActiveRecord::Migration
  def change
	drop_table :artists_performers
	drop_table :bands_performers
	drop_table :performers
	
	create_table :artists_records, id: false do |t|
	t.belongs_to :artist, index: true
        t.belongs_to :record, index: true
	end
	create_table :bands_records, id: false do |t|
	t.belongs_to :band, index: true
        t.belongs_to :record, index: true
	end
  end
end
