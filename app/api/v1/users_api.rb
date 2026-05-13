module V1
  class UsersApi < Grape::API
    helpers V1::Helpers::AuthHelper

    resource :users do
      # POST /api/v1/users
      params do
        requires :username, type: String, desc: "The username of the user"
        requires :email, type: String, desc: "The email of the user"
        requires :password, type: String, desc: "The password of the user"
      end
      post do
        User.create(username: params[:username], email: params[:email], password: params[:password])
      end

      # PUT /api/v1/users/:id
      params do
        requires :username, type: String, desc: "The username of the user"
        requires :email, type: String, desc: "The email of the user"
        requires :password, type: String, desc: "The password of the user"
      end
      put ":id" do
        logged_in?
        User.find(params[:id]).update(username: params[:username], email: params[:email], password: params[:password])
      end

      # GET /api/v1/users/:id
      get ":id" do
        logged_in?
        user = User.find(params[:id])
        UserSerializer.new(user, include: [:articles]).serializable_hash
      end
    end
  end
end