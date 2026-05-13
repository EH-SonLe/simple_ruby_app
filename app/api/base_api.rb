class BaseApi < Grape::API
  format :json
  prefix :api

  version 'v1', using: :path

  mount V1::ArticlesApi
  mount V1::UsersApi
  mount V1::SessionsApi
end