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

    click_on "Create Mic"

    assert_text "Mic was successfully created"
    click_on "Back"
  end

  test "updating a Mic" do
    visit mics_url
    click_on "Edit", match: :first

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
