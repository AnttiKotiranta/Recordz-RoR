class Artist < ActiveRecord::Base
	has_and_belongs_to_many :bands
	has_and_belongs_to_many :performers
	has_many :records, through: :performers

end
