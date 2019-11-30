class Users::ProfilesController < Users::ApplicationController
  before_action :only_user

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'プロフィールを変更しました'
      redirect_to dashboard_index_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :profile, :image)
  end
end
