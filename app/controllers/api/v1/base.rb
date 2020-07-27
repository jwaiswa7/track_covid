class Api::V1::Base < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  skip_before_action :verify_authenticity_token

  def not_found
    render json: { 'error': 'Invalid request' }, status: :not_found
    end
end
