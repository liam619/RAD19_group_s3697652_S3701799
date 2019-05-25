require 'test_helper'

class DislikeCourseControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:example)
    log_in_as(@user)
    @course = courses(:one)
    @dislike = dislike_courses(:one)
  end
  
  test "like should be valid" do
      assert_not @dislike.valid?
  end
end
