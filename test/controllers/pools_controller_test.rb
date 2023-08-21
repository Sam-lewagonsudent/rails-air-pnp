require "test_helper"

class PoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pools_index_url
    assert_response :success
  end

  test "should get new" do
    get pools_new_url
    assert_response :success
  end

  test "should get create" do
    get pools_create_url
    assert_response :success
  end

  test "should get edit" do
    get pools_edit_url
    assert_response :success
  end

  test "should get update" do
    get pools_update_url
    assert_response :success
  end

  test "should get show" do
    get pools_show_url
    assert_response :success
  end

  test "should get delete" do
    get pools_delete_url
    assert_response :success
  end
end
