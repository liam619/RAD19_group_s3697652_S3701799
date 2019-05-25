require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  def setup
    @course = courses(:one)
  end
  test "image should not be too large" do
        @course.image
        assert_not @course.valid?
    end
end
