require "application_system_test_case"

class VolsTest < ApplicationSystemTestCase
  setup do
    @vol = vols(:one)
  end

  test "visiting the index" do
    visit vols_url
    assert_selector "h1", text: "Vols"
  end

  test "creating a Vol" do
    visit vols_url
    click_on "New Vol"

    fill_in "Arrival airport", with: @vol.arrival_airport
    fill_in "Business class seats", with: @vol.business_class_seats
    fill_in "Departure airport", with: @vol.departure_airport
    fill_in "Departure date", with: @vol.departure_date
    fill_in "Duration", with: @vol.duration
    fill_in "Economy class seats", with: @vol.economy_class_seats
    fill_in "Number", with: @vol.number
    click_on "Create Vol"

    assert_text "Vol was successfully created"
    click_on "Back"
  end

  test "updating a Vol" do
    visit vols_url
    click_on "Edit", match: :first

    fill_in "Arrival airport", with: @vol.arrival_airport
    fill_in "Business class seats", with: @vol.business_class_seats
    fill_in "Departure airport", with: @vol.departure_airport
    fill_in "Departure date", with: @vol.departure_date
    fill_in "Duration", with: @vol.duration
    fill_in "Economy class seats", with: @vol.economy_class_seats
    fill_in "Number", with: @vol.number
    click_on "Update Vol"

    assert_text "Vol was successfully updated"
    click_on "Back"
  end

  test "destroying a Vol" do
    visit vols_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vol was successfully destroyed"
  end
end
