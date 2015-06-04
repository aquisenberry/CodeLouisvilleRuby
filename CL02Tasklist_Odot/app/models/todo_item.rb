class TodoItem < ActiveRecord::Base
  belongs_to :todoList
  validates :content, presence: true,
  				length:{minimum: 2}
end
