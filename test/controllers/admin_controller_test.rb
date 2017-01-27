require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get jsapiconfig" do
    get admin_jsapiconfig_url
    assert_response :success
  end

end
