class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  belongs_to :role
  has_one :volonteer
  has_one :organisation
  has_one :individual

   def is_volonteer?
    self.role_id == 1
  end

  def is_organisation?
    self.role_id == 2
  end

   def is_individual?
    self.role_id == 6
  end
end
