class User < ActiveRecord::Base
  include Clearance::User
  acts_as_authorization_subject
  
  has_one :thumbometer
  
  attr_accessible :username
  validates_presence_of :username
  validates_uniqueness_of :username
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.authenticate(email, password)
    user = find(:first, :conditions => ['username = ? OR email = ?', email.to_s.downcase, email.to_s.downcase])
    user && user.authenticated?(password) ? user : nil
  end
end
