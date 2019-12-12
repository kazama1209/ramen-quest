class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url  = "https://ramen-quest.herokuapp.com/signup/#{user.activation_token}/activate"
    mail(to: user.email, subject: Settings.mail.activation_needed)
  end

  def activation_success_email(user)
    @user = user
    @url  = 'https://ramen-quest.herokuapp.com/login'
    mail(to: user.email, subject: Settings.mail.activation_success)
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_url(@user.reset_password_token)
    mail(to: user.email, subject: Settings.mail.reset_password)
  end

  def inquiry(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.email, subject: Settings.mail.inquiry)
  end
end
