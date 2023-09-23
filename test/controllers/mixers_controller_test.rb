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
      post mixers_url, params: { mixer: { 2tr_in_l: @mixer.2tr_in_l, 2tr_in_r: @mixer.2tr_in_r, 2tr_out_l: @mixer.2tr_out_l, 2tr_out_r: @mixer.2tr_out_r, 2tr_to_ctrl_room: @mixer.2tr_to_ctrl_room, 2tr_to_mix: @mixer.2tr_to_mix, ctrf_room_out_l: @mixer.ctrf_room_out_l, ctrl_room_out_r: @mixer.ctrl_room_out_r, fx_send: @mixer.fx_send, fx_send_value: @mixer.fx_send_value, fx_to_ctrl_room: @mixer.fx_to_ctrl_room, main_mix_value: @mixer.main_mix_value, main_out_l: @mixer.main_out_l, main_out_r: @mixer.main_out_r, phantom: @mixer.phantom, phones: @mixer.phones, phones_value: @mixer.phones_value, song_id: @mixer.song_id } }
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
    patch mixer_url(@mixer), params: { mixer: { 2tr_in_l: @mixer.2tr_in_l, 2tr_in_r: @mixer.2tr_in_r, 2tr_out_l: @mixer.2tr_out_l, 2tr_out_r: @mixer.2tr_out_r, 2tr_to_ctrl_room: @mixer.2tr_to_ctrl_room, 2tr_to_mix: @mixer.2tr_to_mix, ctrf_room_out_l: @mixer.ctrf_room_out_l, ctrl_room_out_r: @mixer.ctrl_room_out_r, fx_send: @mixer.fx_send, fx_send_value: @mixer.fx_send_value, fx_to_ctrl_room: @mixer.fx_to_ctrl_room, main_mix_value: @mixer.main_mix_value, main_out_l: @mixer.main_out_l, main_out_r: @mixer.main_out_r, phantom: @mixer.phantom, phones: @mixer.phones, phones_value: @mixer.phones_value, song_id: @mixer.song_id } }
    assert_redirected_to mixer_url(@mixer)
  end

  test "should destroy mixer" do
    assert_difference('Mixer.count', -1) do
      delete mixer_url(@mixer)
    end

    assert_redirected_to mixers_url
  end
end
