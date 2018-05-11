require "application_system_test_case"

class NeedsTest < ApplicationSystemTestCase
  setup do
    @need = needs(:one)
  end

  test "visiting the index" do
    visit needs_url
    assert_selector "h1", text: "Needs"
  end

  test "creating a Need" do
    visit needs_url
    click_on "New Need"

    fill_in "Category", with: @need.category
    fill_in "Comment", with: @need.comment
    fill_in "Enabled", with: @need.enabled
    fill_in "Item", with: @need.item
    fill_in "Organization", with: @need.organization_id
    click_on "Create Need"

    assert_text "Need was successfully created"
    click_on "Back"
  end

  test "updating a Need" do
    visit needs_url
    click_on "Edit", match: :first

    fill_in "Category", with: @need.category
    fill_in "Comment", with: @need.comment
    fill_in "Enabled", with: @need.enabled
    fill_in "Item", with: @need.item
    fill_in "Organization", with: @need.organization_id
    click_on "Update Need"

    assert_text "Need was successfully updated"
    click_on "Back"
  end

  test "destroying a Need" do
    visit needs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Need was successfully destroyed"
  end
end
