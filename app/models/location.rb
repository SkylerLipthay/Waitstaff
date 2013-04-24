class Location < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip_code, :phone, :website,
    :email, :sales_tax, :minimum_total, :delivery_fee, :delivery_fee_type

  validates_presence_of :address, :city, :state
  validates_uniqueness_of :address, scope: [:city, :state, :zip_code]
  validates_format_of :zip_code, with: /\A[0-9]{5}(-[0-9]{4})?\Z/
  validates_inclusion_of :delivery_fee_type, in: %w(fixed percent distance)
  validates_inclusion_of :state, in: LocationsHelper::us_state_codes
  validates_numericality_of :sales_tax, greater_than_or_equal_to: 0.0
  validates_numericality_of :minimum_total, greater_than_or_equal_to: 0.0
  validates_numericality_of :delivery_fee, greater_than_or_equal_to: 0.0
  validates_plausible_phone :phone
  validates_format_of :email, :with => Authlogic::Regex.email
end