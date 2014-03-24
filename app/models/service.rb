class Service < ActiveRecord::Base
  attr_accessible :costs, :description_general, :description_technical, :name, :owner_id, :server_location


  belongs_to :owner, :class_name => "User"

  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions



  validates :costs, :presence => true
  validates :name, :presence => true, :length => {:maximum => 50}
  validates :owner_id, :presence => true
  validates :server_location, :presence => true

  validates_uniqueness_of :name

  validates_numericality_of :costs, :greater_than_or_equal_to => 0



end
