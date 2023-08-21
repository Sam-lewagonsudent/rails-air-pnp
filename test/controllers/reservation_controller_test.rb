require "test_helper"

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservation_index_url
    assert_response :success
  end

  test "should get new" do
    get reservation_new_url
    assert_response :success
  end

  test "should get create" do
    get reservation_create_url
    assert_response :success
  end

  test "should get edit" do
    get reservation_edit_url
    assert_response :success
  end

  test "should get update" do
    get reservation_update_url
    assert_response :success
  end

  test "should get show" do
    get reservation_show_url
    assert_response :success
  end

  test "should get delete" do
    get reservation_delete_url
    assert_response :success
  end
end
