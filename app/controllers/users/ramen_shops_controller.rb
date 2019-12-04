class Users::RamenShopsController < Users::ApplicationController
  before_action :only_user, except: %i[index show]
  before_action :set_shop, only: %i[show edit update]

  def index
    @q = RamenShop.ransack(params[:q])
    prefectures = params[:prefecture].blank? ? RamenShop.prefectures.values : params[:prefecture]
    @ramen_shops = @q.result(distinct: true).where(prefecture: prefectures).page(params[:page]).order(created_at: :desc)
  end

  def show
    @reviews = @ramen_shop.reviews.includes(:user).page(params[:page]).order(created_at: :desc)
  end

  def new
    @ramen_shop = RamenShop.new
  end

  def create
    @ramen_shop = RamenShop.new(shop_params)

    return render :new unless @ramen_shop.save

    flash[:success] = '登録に成功しました'
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
    params.require(:ramen_shop).permit(:name, :prefecture, :address, :phone, :image)
  end
end
