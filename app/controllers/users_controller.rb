class UsersController < ApplicationController

  def signup
    @user = User.new(user_params)
    @user.ensure_access_token
    if @user.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    username = params[:username].downcase
    @user = User.where("lower(username) = ?", username).first
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok
    else
      render json: { errors: "Username or password was incorrect." }, status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:email, :password, :first_name, :last_name, :username)
  end
end
