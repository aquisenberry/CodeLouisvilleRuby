require 'spec_helper'

describe "Adding Todo Items" do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	
	it "is succesful with valid content" do
		createNewTodoItem("Milk")
		expect(page).to have_content("Added todo list item.")
		within("ul.todo-items")do
			expect(page).to have_content("Milk")			
		end
	end
	it "displays an error with no content" do
		createNewTodoItem("")
		within("div.flash") do 
			expect(page).to have_content("There was a problem adding the todo list item")
		end
		expect(page).to have_content("Content can't be blank")
	end
	it "displays an error with content less than 2 characters" do
		createNewTodoItem("W")
		within("div.flash") do 
			expect(page).to have_content("There was a problem adding the todo list item")
		end
		expect(page).to have_content("Content is too short")
	end
	
end
