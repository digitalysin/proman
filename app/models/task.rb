class Task < ActiveRecord::Base
  belongs_to :milestone
  has_and_belongs_to_many :users
end
