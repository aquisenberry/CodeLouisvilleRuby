class TodoList < ActiveRecord::Base
	has_many :todoItems, foreign_key: 'todoList_id'

	validates :title, presence: true
	validates :title, length:{minimum: 3}
	validates :description, presence: true
	validates :description, length:{minimum: 3}
end
