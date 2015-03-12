class Record < ActiveRecord::Base
	belongs_to :performer
	has_many :artists, through: :performer
	has_many :bands, through: :performer
	has_and_belongs_to_many :users
end
