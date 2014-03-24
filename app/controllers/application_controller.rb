class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :access

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t(:access_denied)
    redirect_to root_url
  end

  def access

    # URL of the REST interface for the Context Handler:
    chUrl = 'http://xacml.snet.tu-berlin.de:8080/servlets-all/contextHandler/request/'

    # Reading attributes from the HTTP request header:
    # - Subject (= requesting Entity)
    # - Object (= requested URL)
    # - Action (= HTTP action)

    xacmlResource = request.url.to_s
    xacmlAction = request.method.to_s

    if(current_user) 
    # Username will only be sent to Context Handler if a user is logged on
    # could be easily adapted to specific requirements or external
    # user authentication

      xacmlSubject = current_user.username # shows the clear text username
      # xacmlSubject = current_user.id # show the user id
      # xacmlSubject = 'userReal' # statical approach

    end 

    # Instanciate Xacml class:
    # 1st parameter: URL of the Context Handler (String)
    # 2nd parameter: Default Policy (Deny or Permit) if Intermediate or NotApplicable (String)
    # 3rd parameter: Version of XACML format, could be 2 or 3 (Integer)

    ts = Xacml.new(chUrl, "Permit", 2)

    if(!request.GET['ssid'].nil?) 
        xacmlEnvSSID = request.GET['ssid']
    else 
        xacmlEnvSSID = nil
    end

    # Request for XACML decision:
    # 1st parameter: Subject (String)
    # 2nd parameter: Resource (String)
    # 3rd parameter: Action (String)

    decision = ts.decision xacmlSubject, xacmlResource, xacmlAction, xacmlEnvSSID

    # Defined behaviour of Ruby if access is denied
    # could be easily adopted to the CI by external error pages

    if( decision == "Deny")
      render :text => "Access is denied by policy!"
    end


    return false
  end

end
