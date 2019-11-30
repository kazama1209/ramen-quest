class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url  = "http://localhost:3000/signup/#{user.activation_token}/activate"
    mail(to: user.email, subject: Settings.mail.activation_needed)
  end

  def activation_success_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: user.email, subject: Settings.mail.activation_success)
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_url(@user.reset_password_token)
    mail(to: user.email, subject: Settings.mail.reset_password)
  end
end
