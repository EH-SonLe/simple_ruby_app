class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def index
    render html: "<h1>Show users</h1>".html_safe
  end

  def show
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
    render html: "<h1>Edit user</h1>".html_safe
  end

  def update
    if @user.update(params.permit(:username, :email, :password))
      render json: { success: true }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end