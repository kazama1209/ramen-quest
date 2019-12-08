class Users::CompletionsController < Users::ApplicationController
  before_action :only_user

  def create
    @completion = current_user.completions.build(ramen_shop_id: params[:ramen_shop_id])

    return unless @completion.save

    redirect_to ramen_shop_path(@completion.ramen_shop)
  end

  def destroy
    @completion = Completion.find_by(user_id: current_user.id, ramen_shop_id: params[:ramen_shop_id])

    return unless @completion.destroy

    redirect_to ramen_shop_path(@completion.ramen_shop)
  end
end
