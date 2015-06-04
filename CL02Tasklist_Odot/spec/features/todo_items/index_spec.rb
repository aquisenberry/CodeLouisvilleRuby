require 'spec_helper'

describe "Viewing Todo Items" do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	def visitTodoList(list) 
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end	
	end
	
	it "displays title of the todo list" do
		visitTodoList(todoList)
		within("h1") do
			expect(page).to have_content(todoList.title)
		end
	end
	it "displays no items when a todo list is empty" do
		visitTodoList(todoList)
		expect(page.all("ul.todo-items li").size).to eq(0)
	end
	it "displays item content when a todo list has items" do
		todoList.todoItems.create(content: "Milk")
		todoList.todoItems.create(content: "Eggs")	
		visitTodoList(todoList)
		expect(page.all("ul.todo-items li").size).to eq(2)
		within("ul.todo-items") do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end
	end
end