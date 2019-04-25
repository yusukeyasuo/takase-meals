require 'test_helper'

class OrderingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ordering_index_url
    assert_response :success
  end

  test "should get edit" do
    get ordering_edit_url
    assert_response :success
  end

  test "should get update" do
    get ordering_update_url
    assert_response :success
  end

  test "should get delete" do
    get ordering_delete_url
    assert_response :success
  end

end
