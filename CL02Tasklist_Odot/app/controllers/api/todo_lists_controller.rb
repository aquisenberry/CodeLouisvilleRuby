class Api::TodoListsController < Api::ApiController
	def index
		render json: TodoList.all
	end
	def show
		list = TodoList.find(params[:id])
		render json: list.as_json(include: [:todoItems])
	end
	def create
		list = TodoList.new(list_params)
		if list.save
			render status: 200,
				json: {
					message: "Successfully created todo list.",
					todo_list: list
				}.to_json
		else
			render status: 422,
				json: {
					errors: list.errors
				}.to_json
		end
	end
	def destroy
		list = TodoList.find(params[:id])
		list.destroy
		render status: 200,
			json: {
				message: "Successfully destroyed todo list."
			}.to_json
	end
	def update
		list = TodoList.find(params[:id])
		if (list.update(list_params))
			render status: 200,
				json: {
					message: "Successfully updated todo list.",
					todoList: list
				}.to_json
		else
			render status: 422,
				json: {
					message: "Unable to update todo list.",
					todoList: list
				}.to_json
		end
	end
	private
	def list_params
		params.require(:todo_list).permit(:title, :description)
	end
end