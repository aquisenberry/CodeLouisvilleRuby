require 'spec_helper'

describe TodoList do
  it{should have_many(:todoItems).with_foreign_key('todoList_id')}
end
