require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @locations = categories(:one)
    @user = users(:example)
    log_in_as(@user)
  end
  
  test "should get new" do
    get categories_new_url
    assert_response :success
  end

end
