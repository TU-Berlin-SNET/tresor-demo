class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,  :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  attr_accessor :geolocation_lat, :geolocation_long, :geolocation_acc

  has_and_belongs_to_many :roles
  has_many :owned_services, :class_name => "Service", :foreign_key => :owner_id

  has_many :subscriptions
  has_many :subscribed_services, :through => :subscriptions, :source => :service


  def roles?(role)
    return !!self.roles.find_by_name(role)
  end

  def getRolesAsString()
    string = "";
    length = roles.length

    self.roles.each_with_index do |role, i|
      if i < length-1
        string << "#{role.name}, "
      else
        string << role.name
      end
    end

    if string.length == 0
      string = "No roles assigned"
    end

    return string
  end

  def has_access_to_pai
    return has_access_to_service("PAI")
  end

  def has_access_to_verlaufsdoku
    return has_access_to_service("Verlaufsdokumentation")
  end

  private
  def has_access_to_service(name)
    service = Service.find_by_name(name)
    if service.nil?
      return false
    end

    if self.subscribed_services.include?(service)
      return true
    end
    return false
  end
end
