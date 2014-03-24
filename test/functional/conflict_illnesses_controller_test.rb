require 'test_helper'

class ConflictIllnessesControllerTest < ActionController::TestCase
  setup do
    @conflict_illness = conflict_illnesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conflict_illnesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conflict_illness" do
    assert_difference('ConflictIllness.count') do
      post :create, conflict_illness: { description: @conflict_illness.description }
    end

    assert_redirected_to conflict_illness_path(assigns(:conflict_illness))
  end

  test "should show conflict_illness" do
    get :show, id: @conflict_illness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conflict_illness
    assert_response :success
  end

  test "should update conflict_illness" do
    put :update, id: @conflict_illness, conflict_illness: { description: @conflict_illness.description }
    assert_redirected_to conflict_illness_path(assigns(:conflict_illness))
  end

  test "should destroy conflict_illness" do
    assert_difference('ConflictIllness.count', -1) do
      delete :destroy, id: @conflict_illness
    end

    assert_redirected_to conflict_illnesses_path
  end
end
