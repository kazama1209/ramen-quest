class Admins::OpinionsController < Admins::ApplicationController
  def index
    @opinions = Opinion.page(params[:page]).order(created_at: :desc)
  end
end
