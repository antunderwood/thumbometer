class CreateThumbometerSteps < ActiveRecord::Migration
  def self.up
    create_table :thumbometer_steps do |t|
      t.integer :thumbometer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :thumbometer_steps
  end
end
