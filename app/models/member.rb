class Member < ActiveRecord::Base
  set_table_name :users
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  validates_presence_of :first_name, :last_name
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end