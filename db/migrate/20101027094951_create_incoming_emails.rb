class CreateIncomingEmails < ActiveRecord::Migration
  def self.up
    create_table :incoming_emails do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.text :body_text
      t.text :body_html

      t.timestamps
    end
  end

  def self.down
    drop_table :incoming_emails
  end
end
