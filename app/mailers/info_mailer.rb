class InfoMailer < ApplicationMailer
  def notify(feedback)
    @feedback = feedback
    mail(to: [@feedback.email, "projectcamay@gmail.com"], subject: "Your feedback has been received!")
  end
end
