class Users::ArticlesController < Users::ApplicationController
  def index
    categories = params[:category].blank? ? Article.categories.values : params[:category]
    @articles = Article.where(category: categories).page(params[:page]).order(created_at: :desc)
  end

  def show
    @article = Article.unscoped.find(params[:id])
    @related_articles = Article.where(category: @article.category).where.not(id: @article.id).order(created_at: :desc).limit(3)
  end
end
