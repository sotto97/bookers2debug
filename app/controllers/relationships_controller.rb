class RelationshipsController < ApplicationController
	before_action :set_user, only: [:create, :destroy, :following, :followers]

	def create
		@user = User.find(params[:follow_id])
		following = current_user.follow(@user)
		if following.save
			flash[:success] = 'ユーザーをフォローしました'
			redirect_to @user
		else
			flash.now[:alert] = 'ユーザーのフォローに失敗しました'
			redirect_to user_path
		end
	end

	def destroy
		@user = User.find(params[:follow_id])
		following = current_user.unfollow(@user)
		if following.destroy
			flash[:success] = 'ユーザーのフォローを解除しました'
			redirect_to @user
		else
			flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
			redirect_to user_path
		end
	end

	def index
	end

	def show
		@users = User.all
		@relationships = Relationship.all
	end

	private

	def set_user
		@user = User.find(params[:follow_id])
	end
end
