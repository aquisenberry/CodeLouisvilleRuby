require 'spec_helper'

describe "Completing Todo Items" do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	let!(:todoItem){todoList.todoItems.create(content: "Milk")}

	it "Is successful when marking a single item complete" do
		expect(todoItem.completed_at).to be_nil
		visitTodoList todoList

		within domIdFor(todoItem) do
			click_link "Mark Complete"			
		end		
		todoItem.reload
		expect(todoItem.completed_at).to_not be_nil
	end

	context "with completed items" do
		let!(:completedTodoItem){todoList.todoItems.create(content: "Eggs", completed_at: 5.minutes.ago)}

		it "Shows completed items as complete" do
			visitTodoList todoList
			within domIdFor(completedTodoItem) do
				expect(page).to have_content(completedTodoItem.completed_at)	
			end
		end
		it "Does not give the option to mark complete" do
			
		end
	end
end