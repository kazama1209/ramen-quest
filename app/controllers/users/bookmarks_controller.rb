class Users::BookmarksController < Users::ApplicationController
  before_action :only_user
  before_action :set_ramen_shop, only: %i[create destroy]

  def create
    @bookmark = current_user.bookmarks.build(ramen_shop_id: params[:ramen_shop_id])

    return unless @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, ramen_shop_id: params[:ramen_shop_id])

    return unless @bookmark.destroy
  end

  private

  def set_ramen_shop
    @ramen_shop = RamenShop.find(params[:ramen_shop_id])
  end
end
