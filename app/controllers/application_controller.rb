class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { errors: e.message }, status: :not_found
  end
end
