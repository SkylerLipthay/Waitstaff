class User < ActiveRecord::Base
  attr_accessible :email, :business_name, :password, :password_confirmation

  validates_length_of :business_name, :minimum => 2, :maximum => 120

  acts_as_authentic do |c|
    c.validates_length_of_password_confirmation_field_options = { minimum: 0 }
  end
end