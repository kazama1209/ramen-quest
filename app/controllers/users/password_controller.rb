class Users::PasswordController < Users::ApplicationController
  def new; end

  def create
    @user = User.find_by_email(params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      flash[:success] = 'パスワード再設定用のメールを送信しました'
      redirect_to login_path
    else
      flash.now[:danger] = 'メールアドレスが正しくありません'
      render :new
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return unless @user.blank?

    flash[:danger] = '不正なアクセスです'
    redirect_to root_path
  end

  def update
    return redirect_to mypage_password_path, flash: { danger: '現在のパスワードと一致しません' } unless current_user.valid_password?(password_params[:current_password])

    current_user.password_confirmation = password_params[:password_confirmation]

    if current_user.change_password!(password_params[:password])
      flash[:success] = 'パスワードを更新しました'
      redirect_to mypage_password_path
    else
      flash[:danger] = 'パスワードの更新に失敗しました'
      render :edit
    end
  end

  def reset
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    tmp_params = password_params

    return redirect_to edit_password_path(@token), flash: { danger: 'パスワードが空です' } if tmp_params[:password].blank?
    return render :edit, flash: { danger: 'パスワードが一致しません' } if @user.blank?

    if @user.update(password: tmp_params[:password], password_confirmation: tmp_params[:password_confirmation])
      flash[:success] = 'パスワード再設定が完了しました'
      redirect_to login_path
    else
      flash.now[:danger] = 'パスワード再設定に失敗しました'
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
