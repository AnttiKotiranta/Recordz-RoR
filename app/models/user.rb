class User < ActiveRecord::Base
	include AddRecords

	has_and_belongs_to_many :records
	has_secure_password

	validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
	validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{4,}\z/, message: "Password must contain atleast one normal & uppercase letter, a number and be longer than 3 characters." }
end
