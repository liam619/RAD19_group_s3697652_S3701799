require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
#    get '/'
    get root_path
    assert_response :success
  end

  test "should get home" do
#    get static_pages_home_url
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end
  
end
