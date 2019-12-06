class Users::MypageController < Users::ApplicationController
  before_action :only_user

  def reviews
    @my_reviews = current_user.reviews.page(params[:page]).order(created_at: :desc)
    @favorite_reviews = current_user.likes.includes(review: :user).page(params[:page]).order(created_at: :desc)
  end
  
  def bookmarks
    @bookmarks = current_user.bookmarks.includes(:ramen_shop).page(params[:page]).order(created_at: :desc)
  end
  
  def profile; end

  def email; end

  def password; end
end
