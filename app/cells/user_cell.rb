class UserCell < Cell::ViewModel
  def review_master
    @users = User.order_by_reviews.limit(3)
    render
  end

  def conquest_master
    @users = User.order_by_completions.limit(3)
    render
  end
end
