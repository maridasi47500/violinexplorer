require "application_system_test_case"

class MixersTest < ApplicationSystemTestCase
  setup do
    @mixer = mixers(:one)
  end

  test "visiting the index" do
    visit mixers_url
    assert_selector "h1", text: "Mixers"
  end

  test "creating a Mixer" do
    visit mixers_url
    click_on "New Mixer"

    check "2tr in l" if @mixer.2tr_in_l
    check "2tr in r" if @mixer.2tr_in_r
    check "2tr out l" if @mixer.2tr_out_l
    check "2tr out r" if @mixer.2tr_out_r
    check "2tr to ctrl room" if @mixer.2tr_to_ctrl_room
    check "2tr to mix" if @mixer.2tr_to_mix
    check "Ctrf room out l" if @mixer.ctrf_room_out_l
    check "Ctrl room out r" if @mixer.ctrl_room_out_r
    check "Fx send" if @mixer.fx_send
    fill_in "Fx send value", with: @mixer.fx_send_value
    check "Fx to ctrl room" if @mixer.fx_to_ctrl_room
    fill_in "Main mix value", with: @mixer.main_mix_value
    check "Main out l" if @mixer.main_out_l
    check "Main out r" if @mixer.main_out_r
    check "Phantom" if @mixer.phantom
    check "Phones" if @mixer.phones
    fill_in "Phones value", with: @mixer.phones_value
    check "Song" if @mixer.song_id
    click_on "Create Mixer"

    assert_text "Mixer was successfully created"
    click_on "Back"
  end

  test "updating a Mixer" do
    visit mixers_url
    click_on "Edit", match: :first

    check "2tr in l" if @mixer.2tr_in_l
    check "2tr in r" if @mixer.2tr_in_r
    check "2tr out l" if @mixer.2tr_out_l
    check "2tr out r" if @mixer.2tr_out_r
    check "2tr to ctrl room" if @mixer.2tr_to_ctrl_room
    check "2tr to mix" if @mixer.2tr_to_mix
    check "Ctrf room out l" if @mixer.ctrf_room_out_l
    check "Ctrl room out r" if @mixer.ctrl_room_out_r
    check "Fx send" if @mixer.fx_send
    fill_in "Fx send value", with: @mixer.fx_send_value
    check "Fx to ctrl room" if @mixer.fx_to_ctrl_room
    fill_in "Main mix value", with: @mixer.main_mix_value
    check "Main out l" if @mixer.main_out_l
    check "Main out r" if @mixer.main_out_r
    check "Phantom" if @mixer.phantom
    check "Phones" if @mixer.phones
    fill_in "Phones value", with: @mixer.phones_value
    check "Song" if @mixer.song_id
    click_on "Update Mixer"

    assert_text "Mixer was successfully updated"
    click_on "Back"
  end

  test "destroying a Mixer" do
    visit mixers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mixer was successfully destroyed"
  end
end
