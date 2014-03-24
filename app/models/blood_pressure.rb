class BloodPressure < ActiveRecord::Base
  attr_accessible :date, :diastolic, :patient_id, :systolic

  belongs_to :patient


  validates :diastolic, :presence => true
  validates :systolic, :presence => true
  validates :date, :presence => true
  validates :patient, :presence => true

  validates_uniqueness_of :date, :scope => :patient_id

  validates_numericality_of :diastolic, :greater_than_or_equal_to => 0
  validates_numericality_of :diastolic, :less_than_or_equal_to => 300

  validates_numericality_of :systolic, :greater_than_or_equal_to => 0
  validates_numericality_of :systolic, :less_than_or_equal_to => 300
  validates_numericality_of :systolic, :greater_than_or_equal_to => :diastolic

end
