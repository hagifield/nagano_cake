require "test_helper"

class Public::AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_adresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_adresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_adresses_update_url
    assert_response :success
  end

  test "should get create" do
    get public_adresses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_adresses_destroy_url
    assert_response :success
  end
end
