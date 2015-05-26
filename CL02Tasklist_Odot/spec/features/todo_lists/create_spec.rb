require 'spec_helper'
describe "Creating todo lists" do
	def createTodoList(options={})
		options[:title] ||= "My Todo List"
		options[:description] ||= "This is my Todo List"

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")		

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"

		
	end
	it "redirects to the index page on success" do
		createTodoList
		expect(page).to have_content("My Todo List")
	end	
	it "Displays an error when the todo list has no title"do
		expect(TodoList.count).to eq(0)		
		createTodoList title: ""
		expect(page).to have_content("error")		
		expect(TodoList.count).to eq(0)	

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "Displays an error when the todo list has a title < 3 chars"do
		expect(TodoList.count).to eq(0)		

		createTodoList title: "Hi"

		expect(page).to have_content("error")		
		expect(TodoList.count).to eq(0)	

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "Displays an error when the todo list has no description"do
		expect(TodoList.count).to eq(0)		
		createTodoList title: "Hello", description: ""

		expect(page).to have_content("error")		
		expect(TodoList.count).to eq(0)	

		visit "/todo_lists"
		expect(page).to_not have_content("Hello")

	end
end