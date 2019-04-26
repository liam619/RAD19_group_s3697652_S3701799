require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get location_new_url
    assert_response :success
  end

end
