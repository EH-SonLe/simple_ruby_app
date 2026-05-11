class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @user = User.new
    render html: "<h1>User Sign up page</h1>".html_safe
  end

  def create
    @user = User.new(params.permit(:username, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      render json: { success: true }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end
end