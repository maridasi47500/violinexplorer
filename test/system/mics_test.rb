require "application_system_test_case"

class MicsTest < ApplicationSystemTestCase
  setup do
    @mic = mics(:one)
  end

  test "visiting the index" do
    visit mics_url
    assert_selector "h1", text: "Mics"
  end

  test "creating a Mic" do
    visit mics_url
    click_on "New Mic"

    fill_in "Ban", with: @mic.ban
    fill_in "Eq high", with: @mic.eq_high
    fill_in "Eq low", with: @mic.eq_low
    fill_in "Eq mid", with: @mic.eq_mid
    fill_in "Fx", with: @mic.fx
    fill_in "Gain", with: @mic.gain
    fill_in "Level", with: @mic.level
    check "Line in" if @mic.line_in
    check "Low cut" if @mic.low_cut
    check "Mic" if @mic.mic
    fill_in "Mixer", with: @mic.mixer_id
    fill_in "Type", with: @mic.type
    click_on "Create Mic"

    assert_text "Mic was successfully created"
    click_on "Back"
  end

  test "updating a Mic" do
    visit mics_url
    click_on "Edit", match: :first

<<<<<<< HEAD
    fill_in "Ban", with: @mic.ban
    fill_in "Eq high", with: @mic.eq_high
    fill_in "Eq low", with: @mic.eq_low
    fill_in "Eq mid", with: @mic.eq_mid
    fill_in "Fx", with: @mic.fx
    fill_in "Gain", with: @mic.gain
    fill_in "Level", with: @mic.level
    check "Line in" if @mic.line_in
    check "Low cut" if @mic.low_cut
    check "Mic" if @mic.mic
    fill_in "Mixer", with: @mic.mixer_id
    fill_in "Type", with: @mic.type
=======
>>>>>>> 17210051b3144d047c39d3e9b09d6c964351958d
    click_on "Update Mic"

    assert_text "Mic was successfully updated"
    click_on "Back"
  end

  test "destroying a Mic" do
    visit mics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mic was successfully destroyed"
  end
end
