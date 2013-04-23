class Location < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip_code

  validates_presence_of :address, :city, :state
  validates_uniqueness_of :address, scope: [:city, :state, :zip_code]
  validates_format_of :zip_code, with: /\A[0-9]{5}(-[0-9]{4})?\Z/

  acts_as_authentic do |c|
    c.validates_length_of_password_confirmation_field_options = { minimum: 0 }
  end
end