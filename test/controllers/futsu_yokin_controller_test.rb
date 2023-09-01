require "test_helper"

class FutsuYokinControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get futsu_yokin_new_url
    assert_response :success
  end

  test "should get create" do
    get futsu_yokin_create_url
    assert_response :success
  end

  test "should get kekka" do
    get futsu_yokin_kekka_url
    assert_response :success
  end
end
