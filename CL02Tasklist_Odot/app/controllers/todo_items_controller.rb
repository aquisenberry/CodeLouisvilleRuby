class TodoItemsController < ApplicationController
  before_action :findTodoList
  def index
  end

  def new
  	@todoItem = @todoList.todoItems.new
  end

  def create
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
    findTodoItem
  end

  def update
    findTodoItem
    if @todoItem.update_attributes(todoItemParams)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "That todo list item could not be saved"
      render action: :edit
    end
  end

  def destroy
    findTodoItem
    if @todoItem.destroy 
      flash[:success] = "Todo list item was deleted"
    else
      flash[:error] = "Todo list item could not be deleted"
    end
    redirect_to todo_list_todo_items_path
  end
  
  def complete
    findTodoItem
    @todoItem.update_attribute(:completed_at,Time.now)
    redirect_to todo_list_todo_items_path, notice: "Todo item marked as complete"
  end
  
  def url_options
    {todo_list_id: params[:todo_list_id]}.merge(super)
  end
  private
  def todoItemParams
  	params[:todo_item].permit(:content)
  end
  def findTodoList
    @todoList = TodoList.find(params[:todo_list_id])
  end
  def findTodoItem
    @todoItem = @todoList.todoItems.find(params[:id])
  end
end
