require 'test_helper'

class MicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mic = mics(:one)
  end

  test "should get index" do
    get mics_url
    assert_response :success
  end

  test "should get new" do
    get new_mic_url
    assert_response :success
  end

  test "should create mic" do
    assert_difference('Mic.count') do
      post mics_url, params: { mic: {  } }
    end

    assert_redirected_to mic_url(Mic.last)
  end

  test "should show mic" do
    get mic_url(@mic)
    assert_response :success
  end

  test "should get edit" do
    get edit_mic_url(@mic)
    assert_response :success
  end

  test "should update mic" do
    patch mic_url(@mic), params: { mic: {  } }
    assert_redirected_to mic_url(@mic)
  end

  test "should destroy mic" do
    assert_difference('Mic.count', -1) do
      delete mic_url(@mic)
    end

    assert_redirected_to mics_url
  end
end
