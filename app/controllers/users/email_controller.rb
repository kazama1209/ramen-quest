class Users::EmailController < Users::ApplicationController
  before_action :only_user

  def update
    tmp_params = email_params

    return redirect_to mypage_email_path, flash: { danger: '確認用メールアドレスと一致しません' } unless tmp_params[:email] == tmp_params.delete(:email_confirmation)

    flash[:success] = 'メールアドレスを変更しました' if current_user.update(tmp_params)

    redirect_to dashboard_index_path
  end

  private

  def email_params
    params.require(:user).permit(:email, :email_confirmation)
  end
end
