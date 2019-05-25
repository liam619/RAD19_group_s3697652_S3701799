require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  def setup
    @course = courses(:one)
  end
  
  test "image should not be too large" do
        @course.image
        assert_not @course.valid?
  end
  
  test "name should be present" do
    @course.name = "     "
    assert_not @course.valid?
  end
  
  test "description should be present" do
    @course.description = "     "
    assert_not @course.valid?
  end
end
