class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    token = request.headers["Access-Token"]
    if token
      @user ||= User.find_by(access_token: token)
    end
  end

  def authenticate!
    unless current_user
      render json: { errors: "You need to log in." }, status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { errors: e.message }, status: :not_found
  end
end
