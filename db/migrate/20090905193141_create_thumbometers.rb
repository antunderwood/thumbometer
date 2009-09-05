class CreateThumbometers < ActiveRecord::Migration
  def self.up
    create_table :thumbometers do |t|
      t.integer :negative_steps
      t.integer :positive_steps
      t.timestamps
    end
  end

  def self.down
    drop_table :thumbometers
  end
end
