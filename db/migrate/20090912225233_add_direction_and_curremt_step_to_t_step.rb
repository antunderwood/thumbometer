class AddDirectionAndCurremtStepToTStep < ActiveRecord::Migration
  def self.up
    add_column :thumbometer_steps, :current_step, :integer
    add_column :thumbometer_steps, :direction, :string
  end

  def self.down
    remove_column :thumbometer_steps, :current_step
    remove_column :thumbometer_steps, :direction
  end
end
