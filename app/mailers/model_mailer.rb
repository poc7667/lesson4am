class ModelMailer < ActionMailer::Base
  default from: "me@#{ENV['mailgun_domain']}"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.contat_us_notification.subject
  #
  def contat_us_notification(mail_content)
    @greeting = "Hi"
    @mail_content = mail_content
    mail to: "contact_us@#{ENV['mailgun_domain']}"
  end
end
