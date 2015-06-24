require 'spec_helper'

describe "Editing Todo Items" do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	let!(:todoItem){todoList.todoItems.create(content: "Milk")}
	
	it "Is Successful" do
		visitTodoList(todoList)
		within("#todo_item_#{todoItem.id}")do
			click_link "Delete"			
		end
		expect(page).to have_content("Todo list item was deleted")
		expect(TodoItem.count).to eq(0)
	end
end