require 'spec_helper'

describe "Editing Todo Items" do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	let!(:todoItem){todoList.todoItems.create(content: "Milk")}
	def visitTodoList(list) 
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end	
	end
	def createNewTodoItem (content)
		visitTodoList(todoList)
		click_link "New Todo Item"
		fill_in "Content", with: content
		click_button "Save"
	end
	it "is succesful with valid content" do
		visitTodoList(todoList)
		within("#todo_item_#{todoItem.id}")do
			click_link "Edit"			
		end
		fill_in "Content", with: "Lots of Milk"
		click_button "Save"
		expect(page).to have_content("Saved todo list item")
		todoItem.reload
		expect(todoItem.content).to eq("Lots of Milk")
	end
	it "is unsuccessful with no content" do
		visitTodoList(todoList)
		within("#todo_item_#{todoItem.id}")do
			click_link "Edit"			
		end
		fill_in "Content", with: ""
		click_button "Save"
		expect(page).to_not have_content("Saved todo list item")
		expect(page).to have_content("Content can't be blank")
		todoItem.reload
		expect(todoItem.content).to eq("Milk")
	end
	it "is unsuccessful with not enough content" do
		visitTodoList(todoList)
		within("#todo_item_#{todoItem.id}")do
			click_link "Edit"			
		end
		fill_in "Content", with: "a"
		click_button "Save"
		expect(page).to_not have_content("Saved todo list item")
		expect(page).to have_content("Content is too short")
		todoItem.reload
		expect(todoItem.content).to eq("Milk")
	end
	# it "displays an error with content less than 2 characters" do
	# 	createNewTodoItem("W")
	# 	within("div.flash") do 
	# 		expect(page).to have_content("There was a problem adding the todo list item")
	# 	end
	# 	expect(page).to have_content("Content is too short")
	# end
	
end