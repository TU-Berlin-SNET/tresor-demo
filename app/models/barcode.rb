class Barcode < ActiveRecord::Base
  attr_accessible :expiration, :number, :patient_id

  belongs_to :patient

  before_create :set_expiration_date
  before_create :set_number


  private
  def set_number
    loop do
      self.number = Random.rand(100000 .. 1000000)
      found = Barcode.where("number = ?", self.number)
      break unless found.nil?
    end
  end

  private
  def set_expiration_date
    self.expiration = Time.now + 10.minutes
  end

end
