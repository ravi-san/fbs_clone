require "test_helper"

class FacebookUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get facebook_users_new_url
    assert_response :success
  end

  test "should get create" do
    get facebook_users_create_url
    assert_response :success
  end

  test "should get show" do
    get facebook_users_show_url
    assert_response :success
  end
end
