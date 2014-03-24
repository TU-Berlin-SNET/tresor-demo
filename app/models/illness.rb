class Illness < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :conflict_illnesses, :dependent => :destroy
  has_many :medicaments, :through => :conflict_illnesses, :uniq => true

  validates :name, :presence => true, :length => {:maximum => 50}
  validates :description, :presence => true;

end
