class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def index
		@friendships = Friendship.all
	end

	def create
		@friendship = Friendship.new
		@friendship.requester_id = current_user.id
		@friendship.receiver_id = User.find(params[:receiver_id]).id
		@friendship.status = "Pending"
 		@friendship.save
		redirect_to :action => :index
	end

	def show
		@friendship = Friendship.find(params[:id])
	end

	def accept_friend
		@friendship = Friendship.find(params[:friendship_id])
		@friendship.status = "Accepted"
		@friendship.save
		redirect_to friendships_path
	end

end 