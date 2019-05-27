require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example)
    @notadmin = users(:notadmin)
  end

  test "unsuccessful edit" do
    log_in_as(@notadmin)
    get edit_user_path(@notadmin)
    #assert_template 'users/edit'
    patch user_path(@notadmin), params: { user: { name:  "",
                                              email: "exaple@invalid",
                                              password:              "invalid",
                                              password_confirmation: "valid" } }

    #assert_template 'users/edit'
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Success"
    email = "sucess@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end