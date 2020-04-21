class Api::V1::Base < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def not_found
      render :json => {'error': 'Invalid request' }, status: :not_found
    end
end