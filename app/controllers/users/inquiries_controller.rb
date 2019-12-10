class Users::InquiriesController < Users::ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    return render :new unless @inquiry.save

    redirect_to complete_inquiries_path
    @inquiry.give_notification

    UserMailer.inquiry(@inquiry).deliver_now
    slack_info
  end

  private

  def slack_info
    message = '新たな問い合わせがあります。'
    notice_slack(message)
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :kana, :email, :content)
  end
end
