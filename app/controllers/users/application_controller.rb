class Users::ApplicationController < ::ApplicationController
  layout 'users'

  def notice_slack(message)
    notifier = Slack::Notifier.new(Settings.slack.webhook_url)
    notifier.ping(message)
  end

  private

  def only_user
    return if logged_in?

    flash[:danger] = 'ログインが必要です'
    redirect_to login_path
  end

  def redirect_when_logged_in
    redirect_to dashboard_index_path if logged_in?
  end
end
