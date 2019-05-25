require 'test_helper'

class PrerequisiteTest < ActiveSupport::TestCase
  def setup
    @prerequisite = courses(:one)
  end
  
  test "name should be present" do
        @prerequisite.name
        assert_not @prerequisite.valid?
  end
end
