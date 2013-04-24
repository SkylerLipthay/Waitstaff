class Location < ActiveRecord::Base
  belongs_to :user

  attr_accessible :address, :city, :state, :zip_code, :phone, :website,
    :email, :sales_tax, :minimum_total, :delivery_fee, :delivery_fee_type,
    :order_options, :max_distance

  validates_presence_of :address, :city, :state
  validates_uniqueness_of :address, scope: [:city, :state, :zip_code]
  validates_format_of :zip_code, with: /\A[0-9]{5}(-[0-9]{4})?\Z/
  validates_inclusion_of :delivery_fee_type,
    in: LocationsHelper::delivery_fee_type_values
  validates_inclusion_of :order_options,
    in: LocationsHelper::order_option_values
  validates_inclusion_of :state, in: LocationsHelper::us_state_codes
  validates_numericality_of :sales_tax, greater_than_or_equal_to: 0.0
  validates_numericality_of :minimum_total, greater_than_or_equal_to: 0.0
  validates_numericality_of :delivery_fee, greater_than_or_equal_to: 0.0
  validates_numericality_of :max_distance, greater_than_or_equal_to: 0.0
  validates_plausible_phone :phone
  validates_format_of :email, :with => Authlogic::Regex.email, allow_blank: true
end