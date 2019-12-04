class Users::LikesController < Users::ApplicationController
  before_action :only_user

  def create
    @like = current_user.likes.new(review_id: params[:review_id])

    return unless @like.save

    flash[:success] = 'いいね！しました'
    redirect_to review_path(@like.review)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])

    return unless @like.destroy

    flash[:success] = 'いいね！を取り消しました'
    redirect_to review_path(@like.review)
  end
end
