require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
   
   test "the truth" do
    assert true
   end
   
   test "should get new" do
    get new_contact_url
    assert_response :success
  end
  
  test "should get show" do
    get contact_url
    assert_response :success
  end
  
end
