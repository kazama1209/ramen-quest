class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :only_admin

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.activate!
      redirect_to admins_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admins_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :profile, :image)
  end
end
