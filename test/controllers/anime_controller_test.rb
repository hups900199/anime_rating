require "test_helper"

class AnimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anime_index_url
    assert_response :success
  end

  test "should get show" do
    get anime_show_url
    assert_response :success
  end
end
