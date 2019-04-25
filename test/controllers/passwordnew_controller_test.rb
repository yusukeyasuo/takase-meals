require 'test_helper'

class PasswordnewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passwordnew_index_url
    assert_response :success
  end

end
