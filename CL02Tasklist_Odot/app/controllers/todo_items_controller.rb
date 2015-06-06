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

  def edit
    @todoList = TodoList.find(params[:todo_list_id])
    @todoItem = @todoList.todoItems.find(params[:id])
  end

  def update
    @todoList = TodoList.find(params[:todo_list_id])
    @todoItem = @todoList.todoItems.find(params[:id])
    if @todoItem.update_attributes(todoItemParams)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "That todo list item could not be saved"
      render action: :edit
    end
  end

  def url_options
    {todo_list_id: params[:todo_list_id]}.merge(super)
  end
  private
  def todoItemParams
  	params[:todo_item].permit(:content)
  end
end
