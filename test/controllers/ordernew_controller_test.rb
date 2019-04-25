require 'test_helper'

class OrdernewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ordernew_index_url
    assert_response :success
  end

end
