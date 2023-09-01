require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_top_url
    assert_response :success
  end

  test "should get login" do
    get user_login_url
    assert_response :success
  end

  test "should get logodd" do
    get user_logodd_url
    assert_response :success
  end

  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get create" do
    get user_create_url
    assert_response :success
  end

  test "should get kekka" do
    get user_kekka_url
    assert_response :success
  end

  test "should get mypage" do
    get user_mypage_url
    assert_response :success
  end
end
