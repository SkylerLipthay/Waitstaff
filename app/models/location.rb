class Location < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items
  has_many :orders
  has_many :days

  attr_accessible :address, :city, :state, :zip_code, :phone, :website,
    :sales_tax, :minimum_total, :delivery_fee, :delivery_fee_type,
    :order_options, :max_distance, :item_ids, :login, :password,
    :password_confirmation, :timezone,

    :closed_sunday, :closed_monday, :closed_tuesday, :closed_wednesday,
    :closed_thursday, :closed_friday, :closed_saturday,

    :time_open_sunday, :time_open_monday, :time_open_tuesday,
    :time_open_wednesday, :time_open_thursday, :time_open_friday,
    :time_open_saturday,

    :time_close_sunday, :time_close_monday, :time_close_tuesday,
    :time_close_wednesday, :time_close_thursday, :time_close_friday,
    :time_close_saturday

  validates_presence_of :address, :city, :state
  
  validates_presence_of :time_open_sunday, :time_open_monday, :time_open_tuesday,
    :time_open_wednesday, :time_open_thursday, :time_open_friday,
    :time_open_saturday,

    :time_close_sunday, :time_close_monday, :time_close_tuesday,
    :time_close_wednesday, :time_close_thursday, :time_close_friday,
    :time_close_saturday
  
  validates_uniqueness_of :address, scope: [:city, :state, :zip_code]
  validates_format_of :zip_code, with: /\A[0-9]{5}(-[0-9]{4})?\Z/
  validates_inclusion_of :delivery_fee_type,
    in: LocationsHelper::delivery_fee_type_values
  validates_inclusion_of :order_options,
    in: LocationsHelper::order_option_values
  validates_inclusion_of :state, in: LocationsHelper::us_state_codes
  validates_numericality_of :sales_tax, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 999999.99
  validates_numericality_of :minimum_total, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 9999999999.99
  validates_numericality_of :delivery_fee, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 99999999999.999
  validates_numericality_of :max_distance, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 99999999999.999
  validates_plausible_phone :phone
  validates_inclusion_of :timezone, :in => ActiveSupport::TimeZone.zones_map(&:to_s)

  acts_as_authentic do |c|
    c.validates_length_of_password_confirmation_field_options = { minimum: 0 }
    c.session_class = LocationSession
    c.maintain_sessions = false
  end

  after_initialize :set_time_defaults

  private
  def set_time_defaults
    self.time_open_sunday ||= '09:00:00'
    self.time_open_monday ||= '09:00:00'
    self.time_open_tuesday ||= '09:00:00'
    self.time_open_wednesday ||= '09:00:00'
    self.time_open_thursday ||= '09:00:00'
    self.time_open_friday ||= '09:00:00'
    self.time_open_saturday ||= '09:00:00'
    self.time_close_sunday ||= '22:00:00'
    self.time_close_monday ||= '22:00:00'
    self.time_close_tuesday ||= '22:00:00'
    self.time_close_wednesday ||= '22:00:00'
    self.time_close_thursday ||= '22:00:00'
    self.time_close_friday ||= '22:00:00'
    self.time_close_saturday ||= '22:00:00'
  end
end