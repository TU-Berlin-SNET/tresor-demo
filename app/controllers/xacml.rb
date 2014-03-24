class Xacml

  attr_accessor :contextHandlerURL, :defaultAction, :xacmlVersion

  require 'builder'
  require 'nokogiri'
  require 'open-uri'
  require 'rest_client'


  def initialize(contextHandlerURL, defaultAction, xacmlVersion)

    if (not (defaultAction.eql?('Permit') || defaultAction.eql?('Deny')))
      # checks if the default action is defined in XACML

      raise StandardError "Die DefaultAction muss Deny oder Permit entsprechen! #{defaultAction}"
    end

    if (not (xacmlVersion == 2 || xacmlVersion == 3))
      # checks if the default action is defined in XACML

      raise StandardError "Die XACML Version muss Version 2 oder 3 entsprechen! #{xacmlVersion}"
    end

    @contextHandlerURL = contextHandlerURL
    @defaultAction = defaultAction
    @xacmlVersion = xacmlVersion

  end

  def decision(xacmlSubject, xacmlResoure, xacmlAction, xacmlEnvSSID)

    # Build the XACML Request

    xacmlRequest = formatedXacmlRequest(xacmlSubject, xacmlResoure, xacmlAction, xacmlEnvSSID)
    Rails.logger.debug "Request should be valid: #{xacmlRequest.to_xml}"
    Rails.logger.info "#{xacmlRequest.to_xml}"

    # Send Request to the ContextHandler via REST

    response = RestClient.post contextHandlerURL, xacmlRequest.to_xml, :content_type => 'application/xml'
    httpCode = response.code
    httpBody = response.body
    Rails.logger.debug "Response should be valid: #{response.body}"
    xacmlDecision = Nokogiri::XML(httpBody)
    xacmlDecision = xacmlDecision.xpath("//xacml-context:Decision").text

    tmp = xacmlDecision

    if (httpCode != 200)
      # exit condition, because of an error within the processing, but which are not network/connectivity related

      raise StandardError "The XACML Response from the Context Handler was received with HTTP-Code: #{httpCode}"

    else
      # success of the request, because HTTP/200 was received
      # Checking the Decision

      if (xacmlDecision == 'NotApplicable' || xacmlDecision == 'Indeterminate')

        if (defaultAction == 'Deny')
          xacmlDecision == 'Deny'

        else
          xacmlDecision == 'Permit'
        end
      end

    end

    return xacmlDecision

  end


  private

  def formatedXacmlRequest(xacmlSubject, xacmlResource, xacmlAction, xacmlEnvSSID)
    #
    # Build up XML Request
    #

    if (@xacmlVersion == 2)


      xacmlRequest = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|
        xml.Request('xmlns' => 'urn:oasis:names:tc:xacml:2.0:context:schema:os', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xsi:schemaLocation' => 'urn:oasis:names:tc:xacml:2.0:context:schema:os http://docs.oasis-open.org/xacml/access_control-xacml-2.0-context-schema-os.xsd') do
          xml.Subject {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:subject:subject-id', 'DataType' => 'http://www.w3.org/2001/XMLSchema#string') {
              xml.AttributeValue "#{xacmlSubject}"
            }
          }
          xml.Resource {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:resource:resource-id', 'DataType' => 'http://www.w3.org/2001/XMLSchema#anyURI') {
              xml.AttributeValue "#{xacmlResource}"
            }
          }
          xml.Action {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:action:action-id', 'DataType' => 'http://www.w3.org/2001/XMLSchema#string') {
              xml.AttributeValue "#{xacmlAction}"
            }
          }
          xml.Environment {
	      xml.Attribute('AttributeId' => 'ssid', 'DataType' => 'http://www.w3.org/2001/XMLSchema#string') {
	        xml.AttributeValue "#{xacmlEnvSSID}"
	      }
	  }

        end
      }

    end

    if (@xacmlVersion == 3)


      xacmlRequest = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|
        xml.Request('xmlns' => 'urn:oasis:names:tc:xacml:3.0:core:schema:wd-17', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xsi:schemaLocation' => 'urn:oasis:names:tc:xacml:3.0:core:schema:wd-17
      http://docs.oasis-open.org/xacml/3.0/xacml-core-v3-schema-wd-17.xsd', 'ReturnPolicyIdList' => 'false', 'CombinedDecision' => 'false') do
          xml.Attributes('Category' => 'urn:oasis:names:tc:xacml:1.0:subject-category:access-subject') {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:resource:subject-id', 'IncludeInResult' => 'false') {
              xml.AttributeValue('DataType' => 'urn:oasis:names:tc:xacml:1.0:data-type:String') {
                "#{xacmlSubject}"
              }
            }
          }
          xml.Attributes('Category' => 'urn:oasis:names:tc:xacml:3.0:attribute-category:resource') {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:resource:resource-id', 'IncludeInResult' => 'false') {
              xml.AttributeValue('DataType' => 'http://www.w3.org/2001/XMLSchema#anyURI') {
                "#{xacmlResource}"
              }
            }
          }
          xml.Attributes('Category' => 'urn:oasis:names:tc:xacml:3.0:attribute-category:action') {
            xml.Attribute('AttributeId' => 'urn:oasis:names:tc:xacml:1.0:action:action-id', 'IncludeInResult' => 'false') {
              xml.AttributeValue('DataType' => 'http://www.w3.org/2001/XMLSchema#string') {
                "#{xacmlAction}"
              }
            }
          }
          xml.Attributes('Category' => 'urn:oasis:names:tc:xacml:3.0:attribute-category:environment')

        end
      }

    end
    return xacmlRequest

  end

end


