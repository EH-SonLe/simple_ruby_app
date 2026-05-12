class SessionsController < ApplicationController
  def new
    render html: "<h1>Login</h1>".html_safe
  end

  def create
    params.require(:email)
    params.require(:password)

    @user = User.find_by(email: params[:email].downcase)
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       render json: { success: true }
     else
       render json: { errors: ["Invalid email or password"] }
     end

  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  def destroy
    session[:user_id] = nil
    render json: { success: true }
  end
end