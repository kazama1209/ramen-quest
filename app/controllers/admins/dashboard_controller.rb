class Admins::DashboardController < Admins::ApplicationController
  before_action :only_admin

  def index; end
end
