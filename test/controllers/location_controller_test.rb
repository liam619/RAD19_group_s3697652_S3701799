require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:example)
    log_in_as(@user)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end
  
end
