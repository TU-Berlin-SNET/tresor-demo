require 'test_helper'

class MedicamentsControllerTest < ActionController::TestCase
  setup do
    @medicament = medicaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicament" do
    assert_difference('Medicament.count') do
      post :create, medicament: { description: @medicament.description, name: @medicament.name }
    end

    assert_redirected_to medicament_path(assigns(:medicament))
  end

  test "should show medicament" do
    get :show, id: @medicament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicament
    assert_response :success
  end

  test "should update medicament" do
    put :update, id: @medicament, medicament: { description: @medicament.description, name: @medicament.name }
    assert_redirected_to medicament_path(assigns(:medicament))
  end

  test "should destroy medicament" do
    assert_difference('Medicament.count', -1) do
      delete :destroy, id: @medicament
    end

    assert_redirected_to medicaments_path
  end
end
