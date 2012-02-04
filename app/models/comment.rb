class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :milestone
  belongs_to :task
  validates_presence_of :content
  
  scope :project_comments, lambda {|project_id| where(:project_id => project_id, :milestone_id => nil, :task_id => nil).includes(:user) }
  scope :milestone_comments, lambda {|milestone_id| where(:milestone_id => milestone_id, :project_id => nil, :task_id => nil).includes(:user) }
  scope :task_comments, lambda{|task_id| where(:task_id => task_id, :project_id => nil, :milestone_id => nil).includes(:user) }
end
