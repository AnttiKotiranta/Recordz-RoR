class Record < ActiveRecord::Base
	include AddRecords

	has_and_belongs_to_many :artists
	has_and_belongs_to_many :bands
	has_and_belongs_to_many :users

	validates :name, :year, presence: true
	validates :year, numericality: { greater_than_or_equal_to: 1860, only_integer: true }

	def add_collector(userid)
		if not self.users.find_by id:userid
		collector = User.find_by id:userid
		self.users << collector
		else return false
		end
	end

	def remove_collector(userid)
	if self.users.find_by id:userid
	rec = self.users.find_by id:userid
	self.users.where(id: userid).delete
	end
	end
end
