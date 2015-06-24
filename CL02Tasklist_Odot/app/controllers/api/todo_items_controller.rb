class Api::TodoItemsController < Api::ApiController
	before_filter :find_todo_list
	def create
		item = @list.todoItems.new(item_params)
		if item.save
			render status: 200,
				json: {
					message: "Successfully created todo item.",
					todo_list: @list,
					todo_item: item
				}.to_json
		else
			render status: 422,
				json: {
					errors: item.errors
				}.to_json
		end
	end
	def destroy
		item = @list.todoItems.find(params[:id])
		item.destroy
		render status: 200,
			json: {
				message: "Successfully destroyed todo item."
			}.to_json
	end
	def update
		item = @list.todoItems.find(params[:id])
		if (item.update(item_params))
			render status: 200,
				json: {
					message: "Successfully updated todo item.",
					todo_list: @list,
					todo_item: item
				}.to_json
		else
			render status: 422,
				json: {
					message: "Unable to update todo item.",
					todo_list: @list,
					todo_item: item
				}.to_json
		end
	end
	private
	def item_params
		params.require(:todo_item).permit(:content)
	end
	def find_todo_list
		@list =  TodoList.find(params[:todo_list_id])
	end
end