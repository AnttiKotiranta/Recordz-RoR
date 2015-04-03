module AddRecords
extend ActiveSupport::Concern

	def add_band(bandid)
		if not self.bands.find_by id:bandid
		band = Band.find_by id:bandid
		self.bands << band
		else return false
		end
	end

	def add_record(recordid)
		if self.records.find_by id:recordid
		return false
		else
		rec = Record.find_by id:recordid
		self.records << rec
		end
	end

	def add_artist(artistid)
		if not self.artists.find_by id:artistid
		art = Artist.find_by id:artistid
		self.artists << art
		else return false
		end
	end


end
