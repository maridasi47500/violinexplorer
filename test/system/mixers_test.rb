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

    click_on "Create Mixer"

    assert_text "Mixer was successfully created"
    click_on "Back"
  end

  test "updating a Mixer" do
    visit mixers_url
    click_on "Edit", match: :first

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
