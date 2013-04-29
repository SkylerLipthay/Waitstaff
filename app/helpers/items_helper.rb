module ItemsHelper
  def self.order_options
    [
      ['Delivery & takeout', 'both'],
      ['Delivery only', 'delivery'],
      ['Takeout only', 'takeout']
    ]
  end

  def self.order_option_values
    Array.new(self.order_options.length) do |index|
      self.order_options[index][1]
    end
  end
end