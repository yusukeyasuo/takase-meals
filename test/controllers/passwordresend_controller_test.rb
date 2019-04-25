require 'test_helper'

class PasswordresendControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passwordresend_index_url
    assert_response :success
  end

end
