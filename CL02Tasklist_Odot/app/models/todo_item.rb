class TodoItem < ActiveRecord::Base
  belongs_to :todoList
  validates :content, presence: true,
  				length:{minimum: 2}

  scope :complete, ->{ where("completed_at is not null")}
  scope :incomplete, ->{where(completed_at: nil)}

end
