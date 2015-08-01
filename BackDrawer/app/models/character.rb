class Character < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true,
					 length:{minimum: 2}
					 
end
