class ReviewCell < Cell::ViewModel
  def recent_reviews
    @reviews = Review.includes(:user).order(created_at: :desc).limit(5)
    render
  end

  def many_likes
    @reviews = Review.find(Like.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
    render
  end

  def high_rate
    @reviews = Review.order(rate: :desc).limit(3)
    render
  end
end
