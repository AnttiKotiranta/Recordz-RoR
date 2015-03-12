class Performer < ActiveRecord::Base
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :bands
	has_many :records

	def to_s

	if self.bands_array.nil? and self.artists_array.nil
		"Bands: #{self.bands_array}"
	elsif self.artists_array.nil? and self.bands_array.nil
		"Artists: #{self.artists_array}"
	elsif self.bands_array.nil? and self.artists_array.nil?
		"Bands: #{self.bands_array} | Artists: #{self.artists_array}"
	else nil
	end
	end

	def bands_array
	self.bands.to_a
	end

	def artists_array
	self.artists.to_a
	end
end
