require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Classe", with: @reservation.classe
    fill_in "Heurereservation", with: @reservation.heureReservation
    fill_in "Id", with: @reservation.id
    fill_in "Iduser", with: @reservation.idUser
    fill_in "Nombreplaces", with: @reservation.nombrePlaces
    fill_in "Numerovol", with: @reservation.numeroVol
    click_on "Create Reservation"

    assert_text "La réservation a bien été ajoutée."
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Classe", with: @reservation.classe
    fill_in "Heurereservation", with: @reservation.heureReservation
    fill_in "Id", with: @reservation.id
    fill_in "Iduser", with: @reservation.idUser
    fill_in "Nombreplaces", with: @reservation.nombrePlaces
    fill_in "Numerovol", with: @reservation.numeroVol
    click_on "Update Reservation"

    assert_text "La réservation a bien été modifiée."
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "La réservation a bien été supprimée."
  end
end
