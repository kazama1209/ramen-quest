class Users::SignupController < Users::ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '登録されたメールアドレス宛に確認用のメールを送信しました'
      redirect_to login_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    logout
    flash[:success] = '退会の手続きが完了しました'
    redirect_to root_path
  end

  def activate
    @user = User.load_from_activation_token(params[:id])
    @user.activate!
    flash[:success] = 'ユーザー登録が完了しました'
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile, :image)
  end
end
