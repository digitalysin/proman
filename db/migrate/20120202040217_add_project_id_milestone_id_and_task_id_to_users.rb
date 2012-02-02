class AddProjectIdMilestoneIdAndTaskIdToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.integer :project_id
      t.integer :milestone_id
      t.integer :task_id
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :project_id
      t.remove :milestone_id
      t.remove :task_id
    end
  end
end
