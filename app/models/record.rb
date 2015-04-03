class Record < ActiveRecord::Base
	belongs_to :performer
	has_many :artists, through: :performer
	has_many :bands, through: :performer
	has_and_belongs_to_many :users

	validates :name, :year, presence: true
	validates :year, numericality: { greater_than_or_equal_to: 1860, only_integer: true }
	
end
