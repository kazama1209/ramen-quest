class Users::LikesController < Users::ApplicationController
  before_action :only_user
  before_action :set_review, only: %i[create destroy]

  def create
    @like = current_user.likes.build(review_id: params[:review_id])

    return unless @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])

    return unless @like.destroy
  end

  private

  def set_review
    @review = Review.unscoped.find(params[:review_id])
  end
end
