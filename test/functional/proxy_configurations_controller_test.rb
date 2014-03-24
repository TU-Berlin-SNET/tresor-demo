require 'test_helper'

class ProxyConfigurationsControllerTest < ActionController::TestCase
  setup do
    @proxy_configuration = proxy_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proxy_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proxy_configuration" do
    assert_difference('ProxyConfiguration.count') do
      post :create, proxy_configuration: { ad_linkup: @proxy_configuration.ad_linkup, ldap_linkup: @proxy_configuration.ldap_linkup, location_services: @proxy_configuration.location_services, logging: @proxy_configuration.logging, name: @proxy_configuration.name }
    end

    assert_redirected_to proxy_configuration_path(assigns(:proxy_configuration))
  end

  test "should show proxy_configuration" do
    get :show, id: @proxy_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proxy_configuration
    assert_response :success
  end

  test "should update proxy_configuration" do
    put :update, id: @proxy_configuration, proxy_configuration: { ad_linkup: @proxy_configuration.ad_linkup, ldap_linkup: @proxy_configuration.ldap_linkup, location_services: @proxy_configuration.location_services, logging: @proxy_configuration.logging, name: @proxy_configuration.name }
    assert_redirected_to proxy_configuration_path(assigns(:proxy_configuration))
  end

  test "should destroy proxy_configuration" do
    assert_difference('ProxyConfiguration.count', -1) do
      delete :destroy, id: @proxy_configuration
    end

    assert_redirected_to proxy_configurations_path
  end
end
