class Category < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  
  attr_accessible :name, :description

  validates_length_of :name, in: 2..128
  validates_length_of :description, in: 0..512
end