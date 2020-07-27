module Api
  module V1
    class HotSpotsController < Base
      before_action :set_hot_spot, only: %i[show edit update destroy]
      def index
        @hot_spots = HotSpot.all
        render json: @hot_spots
      end

      def show
        render json: @hot_spot
      end

      private

      def set_hot_spot
        @hot_spot = HotSpot.find(params[:id])
      end
    end
  end
end
