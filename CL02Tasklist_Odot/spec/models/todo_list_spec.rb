require 'spec_helper'

describe TodoList do
  it{should have_many(:todoItems).with_foreign_key('todoList_id')}

  describe "#has_completed_items?" do
  	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}

  	it "returns true with completed todo list items" do
		todoList.todoItems.create(content: "Eggs", completed_at: 1.minute.ago)
		expect(todoList.has_completed_items?).to be_truthy	
  	end

  	it "returns false with no completed todo list items" do
		todoList.todoItems.create(content: "Eggs")
		expect(todoList.has_completed_items?).to be_falsey		
  	end
  end

  describe "#has_incompleted_items?" do
  	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}

  	it "returns true with incompleted todo list items" do
		todoList.todoItems.create(content: "Eggs")
		expect(todoList.has_incompleted_items?).to be_truthy 		
  	end

  	it "returns false with no completed todo list items" do
		todoList.todoItems.create(content: "Eggs", completed_at: 1.minute.ago)
		expect(todoList.has_incompleted_items?).to be_falsey 		
  	end
  end
end
