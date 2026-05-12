class ArticlesController < ApplicationController
  include ApplicationHelper

  before_action :require_login

  def show
    @article = Article.where(user_id: current_user.id, id: params[:id])
    render json: @article
  end

  def index
    @articles = Article.where(user_id: current_user.id)
    render json: @articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.permit(:title, :description))
    @article.user = current_user
    if @article.save
      render json: @article
    else
      render json: { errors: @article.errors.full_messages }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.permit(:title, :description))
      render json: @article
    else
      render json: { errors: @article.errors.full_messages }
    end
  end

  private

  def require_login
    render json: { error: "Unauthorized" }, status: 401 unless logged_in?
  end
end
