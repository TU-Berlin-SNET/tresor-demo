class ProxyConfiguration < ActiveRecord::Base
  attr_accessible :ad_linkup, :ldap_linkup, :location_services, :logging, :name


  validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => true

  validates_inclusion_of :ad_linkup, :in => [true, false];
  validates_inclusion_of :ldap_linkup, :in => [true, false];
  validates_inclusion_of :location_services, :in => [true, false];
  validates_inclusion_of :logging, :in => [true, false];
end
