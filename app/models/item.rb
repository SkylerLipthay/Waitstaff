class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :option_groups
  has_and_belongs_to_many :locations
  has_many :order_items
  has_many :orders, through: :order_items

  attr_accessible :user_id, :name, :description, :price, :order_options, :option_group_ids

  validates_length_of :name, in: 2..128
  validates_length_of :description, in: 0..512
  validates_numericality_of :price, greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 9999999999.99
  validates_inclusion_of :order_options, in: ItemsHelper::order_option_values
end