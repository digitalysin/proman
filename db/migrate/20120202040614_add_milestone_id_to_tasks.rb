class AddMilestoneIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :milestone_id, :integer
  end

  def self.down
    remove_column :tasks, :milestone_id
  end
end
