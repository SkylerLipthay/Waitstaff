class Order < ActiveRecord::Base
  belongs_to :location
  has_many :order_items
  has_many :items, through: :order_items
  
  attr_accessible :address, :city, :state, :zip_code, :phone, :delivery,
    :subtotal, :sales_tax, :delivery_fee, :total, :complete, :updated_at,
    :created_at, :full_name, :number

  validates_presence_of :full_name, :address, :city, :state, :phone, :delivery
  validates_format_of :zip_code, with: /\A[0-9]{5}(-[0-9]{4})?\Z/
  validates_numericality_of :subtotal, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 9999999999.99
  validates_numericality_of :sales_tax, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 99999999999.999
  validates_numericality_of :delivery_fee, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 9999999999.99
  validates_numericality_of :total, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 9999999999.99
  validates_numericality_of :number, greater_than_or_equal_to: 0,
    less_than: 100
  validates_plausible_phone :phone
end