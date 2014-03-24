class Weight < ActiveRecord::Base
  attr_accessible :value, :date, :patient_id

  belongs_to :patient

  validates :value, :presence => true
  validates :date, :presence => true
  validates :patient, :presence => true

  validates_uniqueness_of :date, :scope => :patient_id

  validates_numericality_of :value, :greater_than_or_equal_to => 0
end
