class User < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :option_groups, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :items
  
  attr_accessible :email, :business_name, :password, :password_confirmation

  validates_presence_of :business_name

  acts_as_authentic do |c|
    c.validates_length_of_password_confirmation_field_options = { minimum: 0 }
    c.session_class = UserSession
  end
end