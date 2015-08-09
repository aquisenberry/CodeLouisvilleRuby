class ResourceTypesController < ApplicationController	
	before_action :require_login
	def index
		@session = session[:user_id]
		@resource_types = ResourceType.where(user_id: session[:user_id])
	end

	def new
		@resource_type = ResourceType.new()
	end

	def create
		@resource_type = ResourceType.new(resource_type_params)

		respond_to do |format|
		  if @resource_type.save
		    format.html { redirect_to resource_types_path, notice: 'Resource type was successfully created.' }
		    #format.json { render :show, status: :created, location: @user }
		  else
		    format.html { render :new }
		    format.json { render json: @resource_type.errors, status: :unprocessable_entity }
		  end
		end
	end

	private
		def resource_type_params
      params.require(:resource_type).permit(:type_name, :value_1_header_i, :value_2_header, :value_3_header, :value_4_header, :value_5_header, :value_6_header)
    end
end

