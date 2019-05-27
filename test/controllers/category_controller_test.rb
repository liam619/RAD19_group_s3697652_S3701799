require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:example)
    log_in_as(@user)
  end
  
  test "should get index" do
    get categories_url
    assert_response :success
  end
  
  test "should get new" do
    get new_category_url
    assert_response :success
  end

end
