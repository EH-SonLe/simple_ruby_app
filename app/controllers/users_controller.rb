class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    render html: "<h1>Show users</h1>".html_safe
  end

  def show
    @user = User.find(params[:id])
    render json: {
      data: UserSerializer.new(@user, include: [:articles]).serializable_hash
    }
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

  def edit
    @user = User.find(params[:id])
    render html: "<h1>Edit user</h1>".html_safe
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.permit(:username, :email, :password))
      render json: { success: true }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end
end