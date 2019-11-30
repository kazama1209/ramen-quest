class Users::LoginController < Users::ApplicationController
  before_action :redirect_when_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    tmp_params = login_params
    if login(tmp_params[:email], tmp_params[:password])
      flash[:success] = 'ログインに成功しました'
      redirect_to dashboard_index_path
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています'
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end

  private

  def go_to_dashboard
    if current_user.admin?
      redirect_to admins_dashboard_index_path
    else
      redirect_to dashboard_index_path
    end
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
