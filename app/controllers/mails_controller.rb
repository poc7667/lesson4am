class MailsController < ApplicationController
  def contact_us
    ModelMailer.contat_us_notification(params["comments"]).deliver
    redirect_to root_path
  end
end
