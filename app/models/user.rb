class User < ActiveRecord::Base
  has_many :locations
  
  attr_accessible :email, :business_name, :password, :password_confirmation

  validates_presence_of :business_name

  acts_as_authentic do |c|
    c.validates_length_of_password_confirmation_field_options = { minimum: 0 }
  end
end