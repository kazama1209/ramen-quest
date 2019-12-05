class Admins::InquiriesController < Admins::ApplicationController
  def index
    @inquiries = Inquiry.page(params[:page]).order(created_at: :desc)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end
end
