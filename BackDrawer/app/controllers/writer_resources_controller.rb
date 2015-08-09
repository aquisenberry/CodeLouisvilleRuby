class WriterResourcesController < ApplicationController
	before_action :require_login
	before_action :set_resource, only: [:edit, :update, :show]
	def index
		@resources = WriterResource.where(:user_id => session[:user_id])
	end
	def create
		@resource = WriterResource.new(resource_params)

	    respond_to do |format|
	      if @resource.save
	        format.html { redirect_to @resource, notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def new
		@resource = WriterResource.new()
	end
	def show
		require_ownership(@resource)
		
	end
	def edit
	end
	def update
	    respond_to do |format|
			if @resource.update(resource_params)
				format.html { redirect_to @resource, notice: 'Todo list was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @resource.errors, status: :unprocessable_entity }
			end
	    end
	end
	
	private

	def set_resource
      @resource = WriterResource.find(params[:id])
    end
	def require_ownership( resource)
		if @current_user.id == resource.user_id
	  		true
	  	else
	  		redirect_to writer_resources_path, info: "Please log in to view that content"
	  	end
	end
    def resource_params
      params.require(:writer_resource).permit(:resource_name, :details).merge(user_id: @current_user.id)
    end
end
