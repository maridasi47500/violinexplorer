require 'test_helper'

class MixersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mixer = mixers(:one)
  end

  test "should get index" do
    get mixers_url
    assert_response :success
  end

  test "should get new" do
    get new_mixer_url
    assert_response :success
  end

  test "should create mixer" do
    assert_difference('Mixer.count') do
      post mixers_url, params: { mixer: {  } }
    end

    assert_redirected_to mixer_url(Mixer.last)
  end

  test "should show mixer" do
    get mixer_url(@mixer)
    assert_response :success
  end

  test "should get edit" do
    get edit_mixer_url(@mixer)
    assert_response :success
  end

  test "should update mixer" do
    patch mixer_url(@mixer), params: { mixer: {  } }
    assert_redirected_to mixer_url(@mixer)
  end

  test "should destroy mixer" do
    assert_difference('Mixer.count', -1) do
      delete mixer_url(@mixer)
    end

    assert_redirected_to mixers_url
  end
end
