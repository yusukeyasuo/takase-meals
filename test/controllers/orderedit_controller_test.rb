require 'test_helper'

class OrdereditControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orderedit_index_url
    assert_response :success
  end

end
