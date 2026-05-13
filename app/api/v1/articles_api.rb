module V1
  class ArticlesApi < Grape::API
    helpers V1::Helpers::AuthHelper

    resource :articles do
      before do
        logged_in?
      end
      # GET /api/v1/articles
      get do
        Article.all
      end

      # GET /api/v1/articles/:id
      get ":id" do
        Article.find(params[:id])
      end

      # POST /api/v1/articles
      params do
        requires :title, type: String, desc: "The title of the article"
        requires :description, type: String, desc: "The description of the article"
      end
      post do
        Article.create(title: params[:title], description: params[:description])
      end

      # PUT /api/v1/articles/:id
      params do
        requires :title, type: String, desc: "The title of the article"
        requires :description, type: String, desc: "The description of the article"
      end
      put ":id" do
        Article.find(params[:id]).update(title: params[:title], description: params[:description])
      end

      # DELETE /api/v1/articles/:id
      delete ":id" do
        Article.find(params[:id]).destroy
      end
    end
  end
end