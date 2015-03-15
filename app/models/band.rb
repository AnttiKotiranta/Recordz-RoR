class Band < ActiveRecord::Base
	include AddRecords

	has_and_belongs_to_many :artists
	has_and_belongs_to_many :performers
	has_many :records, through: :performers

	validates :name, :formed,  presence: true


	
end
