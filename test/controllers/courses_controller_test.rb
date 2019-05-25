require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:example)
    log_in_as(@user)
  end
  
  test "should get index" do
    get courses_url
    assert_response :success
  end
  
  test "should get new" do
    get new_course_url
    assert_response :success
  end

end
