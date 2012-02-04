class Project < ActiveRecord::Base
  validates_presence_of :name, :description
  has_many :comments
  has_many :milestones
  has_and_belongs_to_many :users
end
