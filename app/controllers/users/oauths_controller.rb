class Users::OauthsController < Users::ApplicationController
  def oauth
    login_at(params[:provider])
  end

  # rubocop:disable Lint/AssignmentInCondition
  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      flash[:success] = "#{provider.titleize}でログインしました"
      redirect_to dashboard_index_path
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        flash[:success] = "#{provider.titleize}でログインしました"
        redirect_to dashboard_index_path
      rescue StandardError
        flash.now[:danger] = "#{provider.titleize}でのログインに失敗しました"
        redirect_to root_path
      end
    end
    # rubocop:enable Lint/AssignmentInCondition
  end
end
