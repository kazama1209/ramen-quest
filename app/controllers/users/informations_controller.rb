class Users::InformationsController < Users::ApplicationController
  def index
    @informations = Information.page(params[:page]).order(created_at: :desc)
  end

  def show
    @information = Information.unscoped.find(params[:id])
  end
end
