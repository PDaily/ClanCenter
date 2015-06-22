class ApplicationMailer < ActionMailer::Base
  default from: "bot@#{ENV["EMAIL_DOMAIN"]}"
  layout 'mailer'
end
