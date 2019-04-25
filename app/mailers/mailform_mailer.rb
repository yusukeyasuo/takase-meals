class MailformMailer < ActionMailer::Base
  default from: "testsamurai99@gmail.com"
layout "mailer"
  def message_send( mail1 )
     @mail = mail1


    mail to: "chacha@oohara.jp"
  end
end