require "application_system_test_case"

class YtlinksTest < ApplicationSystemTestCase
  setup do
    @ytlink = ytlinks(:one)
  end

  test "visiting the index" do
    visit ytlinks_url
    assert_selector "h1", text: "Ytlinks"
  end

  test "creating a Ytlink" do
    visit ytlinks_url
    click_on "New Ytlink"

    fill_in "Link", with: @ytlink.link
    fill_in "Song", with: @ytlink.song_id
    click_on "Create Ytlink"

    assert_text "Ytlink was successfully created"
    click_on "Back"
  end

  test "updating a Ytlink" do
    visit ytlinks_url
    click_on "Edit", match: :first

    fill_in "Link", with: @ytlink.link
    fill_in "Song", with: @ytlink.song_id
    click_on "Update Ytlink"

    assert_text "Ytlink was successfully updated"
    click_on "Back"
  end

  test "destroying a Ytlink" do
    visit ytlinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ytlink was successfully destroyed"
  end
end
