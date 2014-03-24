require 'test_helper'

class BrokerConfigurationsControllerTest < ActionController::TestCase
  setup do
    @broker_configuration = broker_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:broker_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create broker_configuration" do
    assert_difference('BrokerConfiguration.count') do
      post :create, broker_configuration: { name: @broker_configuration.name }
    end

    assert_redirected_to broker_configuration_path(assigns(:broker_configuration))
  end

  test "should show broker_configuration" do
    get :show, id: @broker_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @broker_configuration
    assert_response :success
  end

  test "should update broker_configuration" do
    put :update, id: @broker_configuration, broker_configuration: { name: @broker_configuration.name }
    assert_redirected_to broker_configuration_path(assigns(:broker_configuration))
  end

  test "should destroy broker_configuration" do
    assert_difference('BrokerConfiguration.count', -1) do
      delete :destroy, id: @broker_configuration
    end

    assert_redirected_to broker_configurations_path
  end
end
