module AddRecords
extend ActiveSupport::Concern

	def add_band(bandid)
	band = Band.find_by id:bandid
	self.bands << band
	end

	def add_record(recordid)
	rec = Performer.find_by id:recordid
	self.performers << rec
	end

	def add_artist(artistid)
	art = Artist.find_by id:artistid
	self.artists << art
	end


end
