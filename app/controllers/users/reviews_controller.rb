class Users::ReviewsController < Users::ApplicationController
  before_action :only_user, except: %i[index show]
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @q = Review.ransack(params[:q])
    prefectures = params[:prefecture].blank? ? Review.prefectures.values : params[:prefecture]
    @reviews = @q.result(distinct: true).includes(:user).where(prefecture: prefectures).page(params[:page]).order(created_at: :desc)
  end

  def show; end

  def create
    ramen_shop = RamenShop.find(params[:format])
    review = current_user.reviews.new(review_params)

    review.shop_name = ramen_shop.name
    review.prefecture = ramen_shop.prefecture
    review.address = ramen_shop.address
    review.ramen_shop_id = ramen_shop.id

    render :new unless review.save

    flash[:success] = 'レビューを投稿しました'
    redirect_to ramen_shop_path(ramen_shop)
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
    params.require(:review).permit(:title, :taste, :rate, :body, :image1, :image2, :image3)
  end
end
