class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_and_belongs_to_many :options
  
  attr_accessible :quantity, :instructions, :base_price, :option_ids, :item_id

  validates_numericality_of :quantity, greater_than_or_equal_to: 1
  validates_length_of :instructions, in: 0..512
  validates_numericality_of :base_price, greater_than_or_equal_to: 0.0
end