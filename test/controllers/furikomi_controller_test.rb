require "test_helper"

class FurikomiControllerTest < ActionDispatch::IntegrationTest
  test "should get select_bank" do
    get furikomi_select_bank_url
    assert_response :success
  end

  test "should get set_bank" do
    get furikomi_set_bank_url
    assert_response :success
  end

  test "should get select_shiten" do
    get furikomi_select_shiten_url
    assert_response :success
  end

  test "should get set_shiten" do
    get furikomi_set_shiten_url
    assert_response :success
  end

  test "should get select_saki_kouza" do
    get furikomi_select_saki_kouza_url
    assert_response :success
  end

  test "should get set_saki_kouza" do
    get furikomi_set_saki_kouza_url
    assert_response :success
  end

  test "should get select_moto_kouza" do
    get furikomi_select_moto_kouza_url
    assert_response :success
  end

  test "should get set_moto_kouza" do
    get furikomi_set_moto_kouza_url
    assert_response :success
  end

  test "should get input_kingaku" do
    get furikomi_input_kingaku_url
    assert_response :success
  end

  test "should get set_kingaku" do
    get furikomi_set_kingaku_url
    assert_response :success
  end

  test "should get kakunin" do
    get furikomi_kakunin_url
    assert_response :success
  end

  test "should get jikkou" do
    get furikomi_jikkou_url
    assert_response :success
  end

  test "should get kekka" do
    get furikomi_kekka_url
    assert_response :success
  end
end
