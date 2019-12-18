class Users::CompletionsController < Users::ApplicationController
  before_action :only_user
  before_action :set_ramen_shop, only: %i[create destroy]

  def create
    @completion = current_user.completions.build(ramen_shop_id: params[:ramen_shop_id])

    return unless @completion.save
  end

  def destroy
    @completion = Completion.find_by(user_id: current_user.id, ramen_shop_id: params[:ramen_shop_id])

    return unless @completion.destroy
  end

  private

  def set_ramen_shop
    @ramen_shop = RamenShop.find(params[:ramen_shop_id])
  end
end
