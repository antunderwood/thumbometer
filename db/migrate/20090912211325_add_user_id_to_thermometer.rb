class AddUserIdToThermometer < ActiveRecord::Migration
  def self.up
    add_column :thumbometers, :user_id, :integer
  end

  def self.down
    remove_column :thumbometers, :user_id
  end
end
