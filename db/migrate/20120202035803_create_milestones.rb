class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.datetime :due_at

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
