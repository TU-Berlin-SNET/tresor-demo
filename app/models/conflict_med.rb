class ConflictMed < ActiveRecord::Base
  attr_accessible :description, :medicament_id, :med_id

  belongs_to :medicament
  belongs_to :med, :class_name => "Medicament"

  validates_presence_of :medicament
  validates_presence_of :med
  validate :medicaments_are_not_equal


  def medicaments_are_not_equal
    errors.add(:medicament_id, :meds_must_not_be_same) unless
        medicament_id != med_id
  end
end
