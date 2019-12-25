class Users::RamenShopsController < Users::ApplicationController
  before_action :only_user, except: %i[index show]
  before_action :set_shop, only: %i[show edit update]

  def index
    @q = RamenShop.ransack(params[:q])
    prefectures = params[:prefecture].blank? ? RamenShop.prefectures.values : params[:prefecture]
    @ramen_shops = @q.result(distinct: true).where(prefecture: prefectures).page(params[:page]).order(created_at: :desc)
  end

  def show
    @review = Review.new
    @reviews = @ramen_shop.reviews.includes(:user).page(params[:page]).order(created_at: :desc)

    return unless logged_in?

    new_browsing_history = @ramen_shop.browsing_histories.build(user_id: current_user.id)

    if current_user.browsing_histories.exists?(ramen_shop_id: params[:id])
      old_browsing_history = current_user.browsing_histories.find_by(ramen_shop_id: params[:id])
      old_browsing_history.destroy
    end

    new_browsing_history.save

    browsing_histories = current_user.browsing_histories.all
    browsing_stock_limit = 5

    browsing_histories[0].destroy if browsing_histories.count > browsing_stock_limit
  end

  def new
    @ramen_shop = RamenShop.new
  end

  def create
    @ramen_shop = RamenShop.new(shop_params)

    return render :new unless @ramen_shop.save

    flash[:success] = '店舗情報を追加しました'
    redirect_to ramen_shops_path
  end

  def edit; end

  def update
    return render :edit unless @ramen_shop.update(shop_params)

    flash[:success] = '店舗情報を変更しました'
    redirect_to ramen_shop_path(@ramen_shop)
  end

  private

  def set_shop
    @ramen_shop = RamenShop.find(params[:id])
  end

  def shop_params
    params.require(:ramen_shop).permit(:name, :prefecture, :address, :phone, :image, :latitude, :longitude)
  end
end
