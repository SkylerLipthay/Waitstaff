class OptionGroup < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items
  has_many :options, dependent: :destroy
  
  attr_accessible :name, :max_selection

  validates_length_of :name, in: 2..128
  validates_numericality_of :max_selection, greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
end