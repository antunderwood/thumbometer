class Thumbometer < ActiveRecord::Base
  acts_as_authorization_object
  belongs_to :user
  has_many :thumbometer_steps
end
