class Users::OpinionsController < Users::ApplicationController
  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.save
    flash[:success] = 'ご意見・ご要望をいただきありがとうございました'
    redirect_to request.referer
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
