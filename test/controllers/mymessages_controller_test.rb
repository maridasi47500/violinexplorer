require 'test_helper'

class MymessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymessage = mymessages(:one)
  end

  test "should get index" do
    get mymessages_url
    assert_response :success
  end

  test "should get new" do
    get new_mymessage_url
    assert_response :success
  end

  test "should create mymessage" do
    assert_difference('Mymessage.count') do
      post mymessages_url, params: { mymessage: { content: @mymessage.content, user_id: @mymessage.user_id } }
    end

    assert_redirected_to mymessage_url(Mymessage.last)
  end

  test "should show mymessage" do
    get mymessage_url(@mymessage)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymessage_url(@mymessage)
    assert_response :success
  end

  test "should update mymessage" do
    patch mymessage_url(@mymessage), params: { mymessage: { content: @mymessage.content, user_id: @mymessage.user_id } }
    assert_redirected_to mymessage_url(@mymessage)
  end

  test "should destroy mymessage" do
    assert_difference('Mymessage.count', -1) do
      delete mymessage_url(@mymessage)
    end

    assert_redirected_to mymessages_url
  end
end
