require "application_system_test_case"

class MymessagesTest < ApplicationSystemTestCase
  setup do
    @mymessage = mymessages(:one)
  end

  test "visiting the index" do
    visit mymessages_url
    assert_selector "h1", text: "Mymessages"
  end

  test "creating a Mymessage" do
    visit mymessages_url
    click_on "New Mymessage"

    fill_in "Content", with: @mymessage.content
    fill_in "User", with: @mymessage.user_id
    click_on "Create Mymessage"

    assert_text "Mymessage was successfully created"
    click_on "Back"
  end

  test "updating a Mymessage" do
    visit mymessages_url
    click_on "Edit", match: :first

    fill_in "Content", with: @mymessage.content
    fill_in "User", with: @mymessage.user_id
    click_on "Update Mymessage"

    assert_text "Mymessage was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymessage" do
    visit mymessages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymessage was successfully destroyed"
  end
end
