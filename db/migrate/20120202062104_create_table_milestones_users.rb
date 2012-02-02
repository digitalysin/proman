class CreateTableMilestonesUsers < ActiveRecord::Migration
  def self.up
    create_table :milestones_users , :id => false do |t|
      t.integer :milestone_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :milestones_users
  end
end
