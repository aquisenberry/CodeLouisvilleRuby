class WriterResource < ActiveRecord::Base
	#belongs_to :resource_type

	validates :resource_name, 	presence: true,
						  		length: {minimum: 2}
	validates :details, 		presence: true,
								length: {minimum: 2}
end
