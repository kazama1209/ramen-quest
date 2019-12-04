class RamenShopCell < Cell::ViewModel
  def many_reviews
    @ramen_shops = RamenShop.find(Review.group(:ramen_shop_id).order('count(ramen_shop_id) desc').limit(3).pluck(:ramen_shop_id))
    render
  end
end
