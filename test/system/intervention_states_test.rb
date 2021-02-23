require "application_system_test_case"

class InterventionStatesTest < ApplicationSystemTestCase
  setup do
    @intervention_state = intervention_states(:one)
  end

  test "visiting the index" do
    visit intervention_states_url
    assert_selector "h1", text: "Intervention States"
  end

  test "creating a Intervention state" do
    visit intervention_states_url
    click_on "New Intervention State"

    fill_in "Description", with: @intervention_state.description
    click_on "Create Intervention state"

    assert_text "Intervention state was successfully created"
    click_on "Back"
  end

  test "updating a Intervention state" do
    visit intervention_states_url
    click_on "Edit", match: :first

    fill_in "Description", with: @intervention_state.description
    click_on "Update Intervention state"

    assert_text "Intervention state was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention state" do
    visit intervention_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention state was successfully destroyed"
  end
end
