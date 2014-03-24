class Medicament < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :conflict_illnesses, :dependent => :destroy
  has_many :illnesses, :through => :conflict_illnesses, :uniq => true

  has_many :conflict_meds, :dependent => :destroy
  has_many :meds, :through => :conflict_meds
  has_many :inverse_conflict_meds, :class_name => "ConflictMed", :foreign_key => :med_id
  has_many :inverse_meds, :through => :inverse_conflict_meds, :source => :medicament

  validates :name, :presence => true, :length => {:maximum => 50}
end
