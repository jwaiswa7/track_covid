module Api
  module V1
    class UsersController < Base
    	before_action :set_user, only: [:show, :edit, :update, :destroy]
    	def index
    		@users = User.all
            render :json => @users
    	end

    	def show
    		render :json => @user
    	end

    	private

    	def set_user
    		@user = User.find(params[:id])
    	end
    end
  end
end