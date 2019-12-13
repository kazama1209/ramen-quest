class Users::ProfilesController < Users::ApplicationController
  before_action :only_user

  def show
    @user = User.find(params[:id])
  end

  def update
    render :edit unless current_user.update(user_params)

    flash[:success] = 'プロフィールを変更しました'
    redirect_to mypage_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end
end
