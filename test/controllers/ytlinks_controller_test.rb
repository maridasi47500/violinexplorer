require 'test_helper'

class YtlinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ytlink = ytlinks(:one)
  end

  test "should get index" do
    get ytlinks_url
    assert_response :success
  end

  test "should get new" do
    get new_ytlink_url
    assert_response :success
  end

  test "should create ytlink" do
    assert_difference('Ytlink.count') do
      post ytlinks_url, params: { ytlink: { link: @ytlink.link, song_id: @ytlink.song_id } }
    end

    assert_redirected_to ytlink_url(Ytlink.last)
  end

  test "should show ytlink" do
    get ytlink_url(@ytlink)
    assert_response :success
  end

  test "should get edit" do
    get edit_ytlink_url(@ytlink)
    assert_response :success
  end

  test "should update ytlink" do
    patch ytlink_url(@ytlink), params: { ytlink: { link: @ytlink.link, song_id: @ytlink.song_id } }
    assert_redirected_to ytlink_url(@ytlink)
  end

  test "should destroy ytlink" do
    assert_difference('Ytlink.count', -1) do
      delete ytlink_url(@ytlink)
    end

    assert_redirected_to ytlinks_url
  end
end
