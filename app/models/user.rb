class User < ActiveRecord::Base
  # # Include default devise modules. Others available are:
  # # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  # 
  # # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  validates_presence_of :email, :password, :first_name, :last_name
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  mount_uploader :avatar, UserUploader
  
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :milestones
  has_and_belongs_to_many :tasks
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end