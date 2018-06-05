require 'test_helper'

class SelectionMailerTest < ActionMailer::TestCase
  test "invitation_to_pay" do
    mail = SelectionMailer.invitation_to_pay
    assert_equal "Invitation to pay", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
