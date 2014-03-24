class Patient < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :sex, :illness_ids, :medicament_ids, :height, :body_surface_area

  has_and_belongs_to_many :illnesses
  has_and_belongs_to_many :medicaments
  has_many :barcodes, :dependent => :destroy
  has_many :blood_pressures, :dependent => :destroy
  has_many :pulses, :dependent => :destroy
  has_many :weights, :dependent => :destroy


  validates :age, :presence => true
  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 25}
  validates :sex, :presence => true

  validates_numericality_of :height, :greater_than_or_equal_to => 20
  validates_numericality_of :height, :less_than_or_equal_to => 300

  validates_numericality_of :body_surface_area, :greater_than_or_equal_to => 0

  validates_numericality_of :age, :greater_than_or_equal_to => 0
  validates_numericality_of :age, :less_than_or_equal_to => 150

  def get_full_name
    return "#{first_name} #{last_name}"
  end

  def date_blood_pressure_array(systolic)
    date_blood_pressure_array = []
    blood_pressures.sort { |a, b| a.date <=> b.date }.each do |bp|
      if systolic == true
        value = bp.systolic
      else
        value = bp.diastolic
      end

      # get [date, value] array for each bp entry. needed to avoid quotation marks
      inner_array = []
      inner_array << bp.date.to_i * 1000
      inner_array << value
      date_blood_pressure_array << inner_array
    end

    return date_blood_pressure_array
  end

  def date_pulse_array()
    date_pulse_array = []
    pulses.sort { |a, b| a.date <=> b.date }.each do |pulse|

      # get [date, value] array for each pulse entry. needed to avoid quotation marks
      inner_array = []
      inner_array << pulse.date.to_i * 1000
      inner_array << pulse.frequency
      date_pulse_array << inner_array
    end

    return date_pulse_array
  end

  def date_weight_array()
    date_weight_array = []
    weights.sort { |a, b| a.date <=> b.date }.each do |weight|

      # get [date, value] array for each pulse entry. needed to avoid quotation marks
      inner_array = []
      inner_array << weight.date.to_i * 1000
      inner_array << weight.value
      date_weight_array << inner_array
    end

    return date_weight_array
  end

end
