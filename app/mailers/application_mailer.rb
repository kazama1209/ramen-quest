class ApplicationMailer < ActionMailer::Base
  default from: Settings.gmail.user_name
  layout 'mailer'
end
