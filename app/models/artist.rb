class Artist < ActiveRecord::Base
	has_and_belongs_to_many :bands
	has_and_belongs_to_many :performers
	has_many :records, through: :performers

	def add_band(bandid)
	band = Band.find_by id:bandid
	self.bands << band
	end

	def add_record(recordid)
	rec = Performer.find_by id:recordid
	self.permormers << rec
	end

end
