module V1
  class SessionsApi < Grape::API
    # POST /api/v1/login
    params do
      requires :email, type: String, desc: "The email of the user"
      requires :password, type: String, desc: "The password of the user"
    end
    post '/login' do
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        env['rack.session'][:user_id] = user.id

        {
          success: true,
          message: 'Logged in successfully',
        }
      else
        error!('Invalid email or password', 401)
      end
    end

    # DELETE /api/v1/logout
    delete '/logout' do
      env['rack.session'][:user_id] = nil

      {
        success: true,
        message: 'Logged out successfully'
      }
    end
  end
end