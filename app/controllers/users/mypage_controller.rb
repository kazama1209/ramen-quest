class Users::MypageController < Users::ApplicationController
  before_action :only_user

  def review; end

  def profile; end

  def email; end

  def password; end
end
