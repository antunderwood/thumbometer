class AddCurrentStepToThumbomter < ActiveRecord::Migration
  def self.up
    add_column "thumbometers", "current_step", :integer
  end

  def self.down
    remove_column "thumbometers", "current_step"
  end
end
