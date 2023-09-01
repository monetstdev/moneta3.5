require "test_helper"

class MeisaiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meisai_index_url
    assert_response :success
  end
end
