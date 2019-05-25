require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:one)
  end
 
 test "name should be present" do
    @location.name = "     "
    assert_not @location.valid?
  end
  
  test "name should not be too long" do
    @location.name = "a" * 51
    assert_not @location.valid?
  end
  
end
