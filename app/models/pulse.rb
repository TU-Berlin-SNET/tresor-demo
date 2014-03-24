class Pulse < ActiveRecord::Base
  attr_accessible :frequency, :date, :patient_id

  belongs_to :patient

  validates :frequency, :presence => true
  validates :date, :presence => true
  validates :patient, :presence => true

  validates_uniqueness_of :date, :scope => :patient_id

  validates_numericality_of :frequency, :greater_than_or_equal_to => 0
end
