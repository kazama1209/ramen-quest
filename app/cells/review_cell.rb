class ReviewCell < Cell::ViewModel
  def popular_reviews
    @reviews = Review.find(Like.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
    render
  end

  def recent_reviews
    @reviews = Review.includes(:user).order(created_at: :desc).limit(5)
    render
  end
end
