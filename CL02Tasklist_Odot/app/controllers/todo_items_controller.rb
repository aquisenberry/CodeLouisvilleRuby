class TodoItemsController < ApplicationController
  def index
  	@todoList = TodoList.find(params[:todo_list_id])
  end

  def new
  	@todoList = TodoList.find(params[:todo_list_id])
  	@todoItem = @todoList.todoItems.new
  end

  def create
  	@todoList = TodoList.find(params[:todo_list_id])
  	@todoItem = @todoList.todoItems.new(todoItemParams)
  	if @todoItem.save
  		flash[:success] = "Added  todo list item."
  		redirect_to todo_list_todo_items_path
  	else
  		flash[:error] = "There was a problem adding the todo list item"
  		render action: :new
  	end
  end

  private
  def todoItemParams
  	params[:todo_item].permit(:content)
  end
end
