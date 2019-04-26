require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

    test "layout links" do
        get root_path
        assert_template 'static_pages/home'
        assert_select "a[href=?]", root_path
        assert_select "a[href=?]", locations_path
        assert_select "a[href=?]", allcourses_path
        assert_select "a[href=?]", signup_path

        get locations_path
        assert_select "title", full_title("Locations")

        get allcourses_path
        assert_select "title", full_title("All Courses")
    end
end
