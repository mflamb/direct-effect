require 'test_helper'

class UsersnewControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get usersnew_create_url
    assert_response :success
  end

end
