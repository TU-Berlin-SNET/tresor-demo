class ConflictIllness < ActiveRecord::Base
  attr_accessible :description, :illness_id, :medicament_id

  belongs_to :illness
  belongs_to :medicament

  validates_presence_of :medicament
  validates_presence_of :illness

end
