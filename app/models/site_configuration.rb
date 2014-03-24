class SiteConfiguration < ActiveRecord::Base
  attr_accessible :name, :geolocation_login

  validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => true
  validates_inclusion_of :geolocation_login, :in => [true, false];
end
