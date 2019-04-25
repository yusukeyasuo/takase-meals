require 'test_helper'

class MailformMailerTest < ActionMailer::TestCase
  test "message_send" do
    mail = MailformMailer.message_send
    assert_equal "Message send", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
