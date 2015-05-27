require 'spec_helper'

describe 'Editing Todo Lists' do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	def updateTodoList(options={})
		options[:title] ||= "My Todo List"
		options[:description] ||= "This is my Todo List"
		todoList = options[:todoList]

		visit "/todo_lists"
		within "#todo_list_#{todoList.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Update Todo list"
	end
	it "updates a todo list successfull with correct information" do
		updateTodoList title: "New Title", description: "New Description", todoList: todoList

		todoList.reload
		
		expect(page).to have_content("Todo list was successfully updated.")
		expect(todoList.title).to eq("New Title")
		expect(todoList.description).to eq("New Description")
		
	end	
	it "displays an error for no title" do
		updateTodoList title: "", description: "New Description", todoList: todoList
		title = todoList.title
		todoList.reload
		
		expect(todoList.title).to eq(title)
		expect(page).to have_content("error")
		
	end	
	it "displays an error for too short title" do
		updateTodoList title: "hi", description: "New Description", todoList: todoList
		expect(page).to have_content("error")
		
	end	
	it "displays an error for no description" do
		updateTodoList title: "New Title", description: "", todoList: todoList
		expect(page).to have_content("error")
		
	end	
	it "displays an error for too short description" do
		updateTodoList title: "New Title", description: "No", todoList: todoList
		expect(page).to have_content("error")
		
	end	


end