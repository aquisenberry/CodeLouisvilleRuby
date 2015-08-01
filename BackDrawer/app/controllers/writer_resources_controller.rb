class WriterResourcesController < ApplicationController
	before_action :require_login
	def index
		@resources = WriterResource.where(:user_id => session[:user_id])
	end
	def new
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
	def show
	end
	def new_type
		@resource_type = ResourceType.new(type_params)
	end
	def show_type
	end
	def list_types

	end
	def type_params
      params.permit(:type_name, :value_1_header_i, :value_2_header, :value_3_header, :value_4_header, :value_5_header, :value_6_header)
    end
    def resource_params
      params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation, :username, :date_of_birth)
    end
end
