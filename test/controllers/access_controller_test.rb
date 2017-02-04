require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get access_login_url
    assert_response :success
  end

  test "should get logout" do
    get access_logout_url
    assert_response :success
  end

end
