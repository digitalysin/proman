class AddClosedToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :closed, :boolean, :default => false
  end

  def self.down
    remove_column :milestones, :closed
  end
end
