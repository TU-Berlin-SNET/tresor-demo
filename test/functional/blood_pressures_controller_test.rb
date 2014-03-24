require 'test_helper'

class BloodPressuresControllerTest < ActionController::TestCase
  setup do
    @blood_pressure = blood_pressures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blood_pressures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blood_pressure" do
    assert_difference('BloodPressure.count') do
      post :create, blood_pressure: { date: @blood_pressure.date, diastolic: @blood_pressure.diastolic, patient_id: @blood_pressure.patient_id, systolic: @blood_pressure.systolic }
    end

    assert_redirected_to blood_pressure_path(assigns(:blood_pressure))
  end

  test "should show blood_pressure" do
    get :show, id: @blood_pressure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blood_pressure
    assert_response :success
  end

  test "should update blood_pressure" do
    put :update, id: @blood_pressure, blood_pressure: { date: @blood_pressure.date, diastolic: @blood_pressure.diastolic, patient_id: @blood_pressure.patient_id, systolic: @blood_pressure.systolic }
    assert_redirected_to blood_pressure_path(assigns(:blood_pressure))
  end

  test "should destroy blood_pressure" do
    assert_difference('BloodPressure.count', -1) do
      delete :destroy, id: @blood_pressure
    end

    assert_redirected_to blood_pressures_path
  end
end
