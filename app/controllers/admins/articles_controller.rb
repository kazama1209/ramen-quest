class Admins::ArticlesController < Admins::ApplicationController
  before_action :only_admin
  before_action :set_article, only: %i[edit update destroy]

  def index
    @articles = Article.page(params[:page]).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    return render :new unless @article.save

    flash[:success] = '投稿に成功しました'
    redirect_to admins_articles_path
  end

  def edit; end

  def update
    return render :edit unless @article.update(article_params)

    flash[:success] = '投稿を編集しました'
    redirect_to admins_articles_path
  end

  def destroy
    @article.destroy
    redirect_to admins_articles_path
  end

  private

  def set_article
    @article = Article.unscoped.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:category, :description, :title, :body, :image)
  end
end
