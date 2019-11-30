class Users::DashboardController < Users::ApplicationController
  before_action :only_user

  def index; end
end
