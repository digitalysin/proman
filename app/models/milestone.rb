class Milestone < ActiveRecord::Base
  belongs_to :project
  has_many :comments
  has_many :tasks
  has_and_belongs_to_many :users
  validates_presence_of :name, :description
end
