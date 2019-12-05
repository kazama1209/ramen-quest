class Users::InquiriesController < Users::ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    return render :new unless @inquiry.save

    redirect_to complete_inquiries_path
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :kana, :email, :content)
  end
end
