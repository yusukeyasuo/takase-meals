require 'test_helper'

class LoginafterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loginafter_index_url
    assert_response :success
  end

end
