require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  test "mailer" do
    contact = Contact.new(name: "Example User", email: "user@example.com", message: "This is a message")
    mail = UserMailer.contact_us(contact)
    assert_equal "YourApp Contact Us", mail.subject
    assert_equal ["s3697652@student.rmit.edu.au"], mail.to
    assert_equal ["noreply@yourapp.com"], mail.from
  end
  
end
