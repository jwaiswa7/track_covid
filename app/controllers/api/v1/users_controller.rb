module Api
  module V1
    class UsersController < Base
    	before_action :set_user, only: [:show, :edit, :update, :destroy]
    	
      def index
    	  @users = User.all
        render :json => @users
    	end

    	def show
    		render json: @user
    	end

        def create

            if user_params["longitude"].present?
              user = User.track(user_params)
            elsif user_params["transport"].present?
              user = User.find_by_imei(user_params["imei"])
              hot_spot = HotSpot.find(user_params["transport"])
              Movement.create!(user: user, hot_spot: hot_spot)
            else
              user = nil
            end
                
            render json: user 
        end

    	private

    	def set_user
    		user = User.find_by_imei(params[:id])
        if !user
          user = User.create(imei: params[:id])
        end 
        @user = user
    	end

        def user_params 
           params.require(:data)
                 .permit(:imei,:nin,:longitude,:latitude,:transport)        
        end
    end
  end
end