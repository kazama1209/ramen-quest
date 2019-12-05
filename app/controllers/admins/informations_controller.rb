class Admins::InformationsController < Admins::ApplicationController
  before_action :only_admin
  before_action :set_information, only: %i[edit update destroy]

  def index
    @informations = Information.page(params[:page]).order(created_at: :desc)
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)

    return render :new unless @information.save

    flash[:success] = '投稿に成功しました'
    redirect_to admins_informations_path
  end

  def edit; end

  def update
    return render :edit unless @information.update(information_params)

    flash[:success] = '投稿を編集しました'
    redirect_to admins_informations_path
  end

  def destroy
    @information.destroy
    redirect_to admins_informations_path
  end

  private

  def set_information
    @information = Information.unscoped.find(params[:id])
  end

  def information_params
    params.require(:information).permit(:title, :body, :image)
  end
end
