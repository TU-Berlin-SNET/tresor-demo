class SessionsController < Devise::SessionsController

  def new
    # @geolocation_enabled = SiteConfiguration.first.geolocation_login
    super
  end

  def create
    #geo_lat = params["lat"].to_f
    #geo_long = params["long"].to_f
    #geo_acc = params["acc"].to_f
    #geolocation_enabled = SiteConfiguration.first.geolocation_login

    #if geolocation_enabled
    #  inside = test_geolocation(geo_lat, geo_long, geo_acc)
    #else
      inside = true
    #end

    #if inside == false
    #  set_flash_message(:error, :invalid_location)
    #  redirect_to :action => "new"
    #else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    #end
  end

  def destroy
    super
  end

  private

  def test_geolocation(lat, long, acc)
    swh_min_lat = 52.509496
    swh_max_lat = 52.511296
    swh_min_long = 13.324771
    swh_max_long = 13.327724

    tel_min_lat = 52.511721
    tel_max_lat = 52.514352
    tel_min_long = 13.317827
    tel_max_long = 13.322258

    if (lat.nil? || long.nil?)
      return false
    end

    inside_swh = swh_min_lat <= lat && lat <= swh_max_lat && swh_min_long <= long && long <= swh_max_long
    inside_tel = tel_min_lat <= lat && lat <= tel_max_lat && tel_min_long <= long && long <= tel_max_long

    if (inside_swh == true || inside_tel == true)
      return true
    end


    return false
  end
end