module ApplicationHelper
  def logo
    logo = image_tag("logo_tresor.png", alt:"TRESOR", id:"logo")
  end

  def logo_pills
    logo_pills = image_tag("logo_pills.png", alt:"Pills", id:"logo_pills")
  end

  def proxy_c
    @proxy = ProxyConfiguration.first
  end
end
