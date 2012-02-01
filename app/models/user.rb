class User < ActiveRecord::Base
  validates_presence_of :first_name, :email, :password
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  mount_uploader :avatar, UserUploader
end
