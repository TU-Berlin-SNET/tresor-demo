class Subscription < ActiveRecord::Base
  attr_accessible :costs, :service_id, :user_id

  belongs_to :subscriber, :class_name => "User", :foreign_key => :user_id
  belongs_to :service


  validates :costs, :presence => true
  validates :user_id, :presence => true
  validates :service_id, :presence => true

  validates_uniqueness_of :service_id, :scope => :user_id

  validates_numericality_of :costs, :greater_than_or_equal_to => 0

end
