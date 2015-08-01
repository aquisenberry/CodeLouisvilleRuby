class User < ActiveRecord::Base
	has_secure_password
	has_many :characters
	has_many :resource_types
	validates :email_address, presence: true,
		uniqueness: true,
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :first_name, presence: true
	validates :last_name,  presence: true
	validates :username, presence: true,
		uniqueness: true,
		length: {minimum: 2}
	validates :date_of_birth, presence: true

	before_save :downcase_email	

	def downcase_email
		self.email_address = email_address.downcase
	end
end
