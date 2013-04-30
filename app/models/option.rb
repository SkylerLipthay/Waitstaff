class Option < ActiveRecord::Base
  belongs_to :option_group
  has_and_belongs_to_many :order_items
  
  attr_accessible :name, :description, :extra

  validates_length_of :name, in: 2..128
  validates_length_of :description, in: 0..512
  validates_numericality_of :extra, greater_than_or_equal_to: 0.0,
    :less_than_or_equal_to: 9999999999.99
end