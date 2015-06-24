module TodoListHelpers
	def visitTodoList(list) 
		visit "/todo_lists"
		within domIdFor(list) do
			click_link "List Items"
		end	
	end
	def createNewTodoItem (content)
		visitTodoList(todoList)
		click_link "New Todo Item"
		fill_in "Content", with: content
		click_button "Save"
	end
end