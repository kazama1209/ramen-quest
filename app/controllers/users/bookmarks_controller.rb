class Users::BookmarksController < Users::ApplicationController
  before_action :only_user

  def create
    @bookmark = current_user.bookmarks.build(ramen_shop_id: params[:ramen_shop_id])

    return unless @bookmark.save

    flash[:success] = 'ブックマークを登録しました'
    redirect_to ramen_shop_path(@bookmark.ramen_shop)
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, ramen_shop_id: params[:ramen_shop_id])

    return unless @bookmark.destroy

    flash[:success] = 'ブックマークを削除しました'
    redirect_to ramen_shop_path(@bookmark.ramen_shop)
  end
end
