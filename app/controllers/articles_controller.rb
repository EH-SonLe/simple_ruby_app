class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.permit(:title, :description))
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
end
