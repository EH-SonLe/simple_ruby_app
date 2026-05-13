module V1
  class UsersApi < Grape::API
    helpers V1::Helpers::AuthHelper

    # POST /api/v1/signup
    params do
      requires :username, type: String, desc: "The username of the user"
      requires :email, type: String, desc: "The email of the user"
      requires :password, type: String, desc: "The password of the user"
    end
    post '/signup' do
      User.create(username: params[:username], email: params[:email], password: params[:password])
    end

    resource :users do
      # PUT /api/v1/users/:id
      params do
        requires :username, type: String, desc: "The username of the user"
        requires :email, type: String, desc: "The email of the user"
        optional :password, type: String, desc: "The password of the user"
      end
      put ":id" do
        logged_in?
        error!('Forbidden', 403) unless current_user.id == params[:id].to_i
        update_params = { username: params[:username], email: params[:email] }
        update_params[:password] = params[:password] if params[:password].present?
        current_user.update(update_params)
      end

      # GET /api/v1/users/:id
      get ":id" do
        logged_in?
        error!('Forbidden', 403) unless current_user.id == params[:id].to_i
        UserSerializer.new(current_user, include: [:articles]).serializable_hash
      end
    end
  end
end