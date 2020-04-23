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

        def create
            user_track_params
            @user = User.track(user_track_params)
            render :json => @user
        end

    	private

    	def set_user
    		user = User.find_by_imei(params[:id])
        if !user
          user = User.create(imei: params[:id])
        end 
        @user = user
    	end

        def user_track_params
           {
              imei: params[:imei], 
              longitude: params[:longitude], 
              latitude: params[:latitude],
              nin: params[:nin]
            }
            
        end
    end
  end
end