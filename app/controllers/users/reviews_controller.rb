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
    @ramen_shop = RamenShop.find(params[:format])

    unless current_user.reviews.create(
      shop_name: @ramen_shop.name,
      prefecture: @ramen_shop.prefecture,
      address: @ramen_shop.address,
      ramen_shop_id: @ramen_shop.id,
      title: review_params[:title],
      taste: review_params[:taste],
      rate: review_params[:rate],
      body: review_params[:body],
      image: review_params[:image]
    )
      render :new
    end

    flash[:success] = 'レビューを投稿しました'
    redirect_to ramen_shop_path(@ramen_shop)
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
    params.require(:review).permit(:prefecture, :address, :shop_name, :title, :taste, :rate, :body, :image)
  end
end
