class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
    	@user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	@user.name = params[:user]["name"]
    	@user.save
    	
    	redirect_to '/users/#{params[:id]}'
    end

end