require 'spec_helper'

describe 'Editing Todo Lists' do
	let!(:todoList){ TodoList.create(title: "Groceries", description: "Grocery List.")}
	it "is successful when clicking the destroy link" do
		visit "/todo_lists"
		within "#todo_list_#{todoList.id}" do
			click_link "Destroy"
		end		
		expect(page).to_not have_content(todoList.title)
		expect(TodoList.count).to eq(0)
	end
end