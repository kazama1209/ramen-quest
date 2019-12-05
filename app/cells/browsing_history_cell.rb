class BrowsingHistoryCell < Cell::ViewModel
  include ApplicationHelper

  def recent_browsing_histories
    current_user ||= User.find_by(id: session[:user_id])
    @browsing_histories = current_user.browsing_histories.includes(:ramen_shop).order(created_at: :desc)
    render
  end
end
