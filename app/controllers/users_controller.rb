    class UsersController < ApplicationController
        before_action :authenticate_user!

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
        @user.update!(user_params)
        #@user.pick_avatar
        @user.save
        redirect_to users_path
    end

    def add_kid
        @user = User.find(params[:id])
        @user.update_attributes(parent_id: current_user.id)
        redirect_to "/users"
    end

    def pick_avatar
      @user = User.find(params[:id])
      @user.update_attributes(avatar: "http://www.clipartbest.com/cliparts/di8/XKg/di8XKgXie.png")
      @user.save
    end

    private

        def user_params
            params.require(:user).permit(:email, :name, :age, :gender, :parent_id, :bio, :username, :role, :avatar)
        end
end