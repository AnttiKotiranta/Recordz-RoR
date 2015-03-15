class Performer < ActiveRecord::Base
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :bands
	has_many :records

	def to_s

	if not self.bands_array.empty? and self.artists_array.empty?
		"Bands: #{self.bands_array}"
	elsif not self.artists_array.empty? and self.bands_array.empty?
		"Artists: #{self.artists_array}"
	elsif not self.bands_array.empty? and not self.artists_array.empty?
		"Bands: #{self.bands_array} | Artists: #{self.artists_array}"
	else nil
	end
	end

	def bands_array
	 a = []
	  self.bands.each do |b|
	  a <<  b.name
	  end	
	 a
	end

	def artists_array
	a = []
	self.artists.each do |art|
	a << art.name
	end	
	a
	end
end
