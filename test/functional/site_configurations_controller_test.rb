require 'test_helper'

class SiteConfigurationsControllerTest < ActionController::TestCase
  setup do
    @site_configuration = site_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_configuration" do
    assert_difference('SiteConfiguration.count') do
      post :create, site_configuration: { geolocation_login: @site_configuration.geolocation_login }
    end

    assert_redirected_to site_configuration_path(assigns(:site_configuration))
  end

  test "should show site_configuration" do
    get :show, id: @site_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_configuration
    assert_response :success
  end

  test "should update site_configuration" do
    put :update, id: @site_configuration, site_configuration: { geolocation_login: @site_configuration.geolocation_login }
    assert_redirected_to site_configuration_path(assigns(:site_configuration))
  end

  test "should destroy site_configuration" do
    assert_difference('SiteConfiguration.count', -1) do
      delete :destroy, id: @site_configuration
    end

    assert_redirected_to site_configurations_path
  end
end
