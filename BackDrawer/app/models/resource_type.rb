class ResourceType < ActiveRecord::Base
	has_many :writer_resources
	belongs_to :user
end

