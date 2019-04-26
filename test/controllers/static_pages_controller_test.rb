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

  test "should get locations" do
#    get static_pages_locations_url
    get locations_path
    assert_response :success
    assert_select "title", "Locations | #{@base_title}"
  end
  
  test "should get allcourses" do
#    get static_pages_allcourses_url
    get allcourses_path
    assert_response :success
    assert_select "title", "All Courses | #{@base_title}"
  end

  test "should get allcoordinators" do
#    get static_pages_allcoordinators_url
    get allcoordinators_path
    assert_response :success
    assert_select "title", "All Coordinators | #{@base_title}"
  end
end
