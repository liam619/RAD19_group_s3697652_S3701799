require 'test_helper'

class LikeCourseControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:example)
    log_in_as(@user)
    @course = courses(:one)
    @like = like_courses(:one)
  end
  
  test "like should be valid" do
      assert_not @like.valid?
  end

end
