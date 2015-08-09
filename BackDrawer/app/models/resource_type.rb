class ResourceType < ActiveRecord::Base
	#has_many :writer_resources
	belongs_to :user

	validates :type_name, presence: true,
						  length: {minimum: 2}
	validates :value_1_header_i, presence: true
end

