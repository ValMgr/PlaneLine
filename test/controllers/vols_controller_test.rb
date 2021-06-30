require "test_helper"

class VolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vol = vols(:one)
  end

  test "should get index" do
    get vols_url
    assert_response :success
  end

  test "should get new" do
    get new_vol_url
    assert_response :success
  end

  test "should create vol" do
    assert_difference('Vol.count') do
      post vols_url, params: { vol: { arrival_airport: @vol.arrival_airport, business_class_seats: @vol.business_class_seats, departure_airport: @vol.departure_airport, departure_date: @vol.departure_date, duration: @vol.duration, economy_class_seats: @vol.economy_class_seats, number: @vol.number } }
    end

    assert_redirected_to vol_url(Vol.last)
  end

  test "should show vol" do
    get vol_url(@vol)
    assert_response :success
  end

  test "should get edit" do
    get edit_vol_url(@vol)
    assert_response :success
  end

  test "should update vol" do
    patch vol_url(@vol), params: { vol: { arrival_airport: @vol.arrival_airport, business_class_seats: @vol.business_class_seats, departure_airport: @vol.departure_airport, departure_date: @vol.departure_date, duration: @vol.duration, economy_class_seats: @vol.economy_class_seats, number: @vol.number } }
    assert_redirected_to vol_url(@vol)
  end

  test "should destroy vol" do
    assert_difference('Vol.count', -1) do
      delete vol_url(@vol)
    end

    assert_redirected_to vols_url
  end
end
