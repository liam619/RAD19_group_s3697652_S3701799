require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  def setup
    @contact = Contact.new(name: "Example User", email: "user@example.com",
                     message: "This is a message")
  end
  
  test "should be valid" do
    assert @contact.valid?
  end
  
  test "email should be present" do
    @contact.email = "     "
    assert_not @contact.valid?
  end
  
  test "message should be present" do
    @contact.message = "     "
    assert_not @contact.valid?
  end
  
end
