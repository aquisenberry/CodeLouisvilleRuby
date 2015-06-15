class TodoList < ActiveRecord::Base
	has_many :todoItems, foreign_key: 'todoList_id'

	validates :title, presence: true
	validates :title, length:{minimum: 3}
	validates :description, presence: true
	validates :description, length:{minimum: 3}


  def has_completed_items?
  	todoItems.complete.size > 0
  end
  def has_incompleted_items?
  	todoItems.incomplete.size > 0
  end
end
