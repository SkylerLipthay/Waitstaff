class Day < ActiveRecord::Base
  belongs_to :location

  attr_accessible :date, :open, :close, :closed

  validates_presence_of :date, :open, :close

  after_initialize :set_time_defaults

  private
  def set_time_defaults
    self.open ||= '09:00:00'
    self.close ||= '22:00:00'
  end
end