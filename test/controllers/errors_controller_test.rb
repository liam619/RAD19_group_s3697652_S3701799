require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  
 test "should get index with 404 error" do
    get error404_url
    assert_response :success
  end
  
  test "should get unprocessable with 422 error" do
    get error422_url
    assert_response :success
  end
  
  test "should get internal_server_error with 500 error" do
    get error500_url
    assert_response :success
  end
  
  #Type is declared as :success 200 means the response will contain an entity corresponding to the requested resource.
  
  test "should get index with 404 error messages" do
    get error404_url
    assert_response(:success, message = "The page you were looking for doesn't exist.")
  end
  
  test "should get unprocessable with 422 error messages" do
    get error422_url
    assert_response(:success, message = "The change you wanted was rejected.")
  end
  
  test "should get internal_server_error with 500 error messages" do
    get error500_url
    assert_response(:success, message = "We're sorry, but something went wrong.")
  end
  
  
end
