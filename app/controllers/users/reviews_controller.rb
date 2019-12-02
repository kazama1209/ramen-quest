class Users::ReviewsController < Users::ApplicationController
  before_action :only_user, except: %i[index show]
  before_action :set_review, only: %i[show edit update destroy]

  def index
    prefectures = params[:prefecture].blank? ? Review.prefectures.values : params[:prefecture]
    @reviews = Review.includes(:user).where(prefecture: prefectures).page(params[:page]).order(created_at: :desc)
  end

  def show; end

  def new
    @review = Review.new
  end

  def create
    render :new unless current_user.reviews.create(review_params)

    flash[:success] = 'レビューを投稿しました'
    redirect_to reviews_path
  end

  def edit; end

  def update
    render :edit unless @review.update(review_params)

    flash[:success] = 'レビューを編集しました'
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました'
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.joins(:user).find(params[:id])
  end

  def review_params
    params.require(:review).permit(:prefecture, :address, :shop_name, :title, :rate, :body, :image)
  end
end
