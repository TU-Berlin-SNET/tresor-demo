require 'test_helper'

class ConflictMedsControllerTest < ActionController::TestCase
  setup do
    @conflict_med = conflict_meds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conflict_meds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conflict_med" do
    assert_difference('ConflictMed.count') do
      post :create, conflict_med: { description: @conflict_med.description }
    end

    assert_redirected_to conflict_med_path(assigns(:conflict_med))
  end

  test "should show conflict_med" do
    get :show, id: @conflict_med
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conflict_med
    assert_response :success
  end

  test "should update conflict_med" do
    put :update, id: @conflict_med, conflict_med: { description: @conflict_med.description }
    assert_redirected_to conflict_med_path(assigns(:conflict_med))
  end

  test "should destroy conflict_med" do
    assert_difference('ConflictMed.count', -1) do
      delete :destroy, id: @conflict_med
    end

    assert_redirected_to conflict_meds_path
  end
end
