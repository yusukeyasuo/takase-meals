# Preview all emails at http://localhost:3000/rails/mailers/mailform_mailer
class MailformMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailform_mailer/message_send
  def message_send
    MailformMailer.message_send
  end

end
