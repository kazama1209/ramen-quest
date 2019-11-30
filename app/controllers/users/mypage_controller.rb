class Users::MypageController < Users::ApplicationController
  before_action :only_user

  def profile; end

  def email; end

  def password; end
end
