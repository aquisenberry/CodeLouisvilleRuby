class AccountsController < ApplicationController
	before_action :set_accounts
	def index
	end
	def show
		@account = Account.find(params[:id])
	end
	def new
		@account = Account.new
		@account.type = params[:type]
	end

	def set_accounts
		@accounts = Account.all
	end
end
