module V1
  class ArticlesApi < Grape::API
    helpers V1::Helpers::AuthHelper

    helpers do
      def find_article
        Article.find_by(id: params[:id], user_id: current_user.id)
      end
    end

    resource :articles do
      before do
        logged_in?
      end
      # GET /api/v1/articles
      get do
        Article.where(user_id: current_user.id)
      end

      # GET /api/v1/articles/:id
      get ":id" do
        article = find_article
        error!('Forbidden', 403) unless article
        article
      end

      # POST /api/v1/articles
      params do
        requires :title, type: String, desc: "The title of the article"
        requires :description, type: String, desc: "The description of the article"
      end
      post do
        article = current_user.articles.create(title: params[:title], description: params[:description])
        if article.persisted?
          article
        else
          error!({ errors: article.errors.full_messages }, 422)
        end
      end

      # PUT /api/v1/articles/:id
      params do
        requires :title, type: String, desc: "The title of the article"
        requires :description, type: String, desc: "The description of the article"
      end
      put ":id" do
        article = find_article
        error!('Forbidden', 403) unless article
        article.update(title: params[:title], description: params[:description])
      end

      # DELETE /api/v1/articles/:id
      delete ":id" do
        article = find_article
        error!('Forbidden', 403) unless article
        article.destroy
      end
    end
  end
end