require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
   
   test "the truth" do
    assert true
   end
   
   test "should get new" do
    get contacts_path
    assert_response :success
  end
end
