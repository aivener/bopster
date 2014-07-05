class UsersController < ApplicationController

	def index
		@users = User.filter(params[:q]).paginate(:per_page => 3, :page => params[:page])
        #@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
    	@user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    	# @user.name = params[:user]["name"]
     #    @user.email = params[:user]["email"]
    	# @user.save

        #binding.pry
    	
    	#redirect_to '/users/#{params[:id]}'
    end

    def add_kid
        @user.id = current_user.id
        @user.save
    end

    private

        def user_params
            params.require(:user).permit(:email, :name, :age, :gender, :parent_id, :bio, :username, :role)
        end
end