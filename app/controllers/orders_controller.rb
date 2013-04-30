class OrdersController < ApplicationController
  before_filter :require_restaurant
  before_filter :get_resource, :only => [:complete]

  layout 'control_panel'

  def index
    sort = 'updated_at ASC'
    @zone = ActiveSupport::TimeZone.new(current_restaurant.timezone)
    @orders = current_restaurant.orders.where(complete: false).
      page(params[:page]).order(sort)
  end

  def complete
    @order.complete = true
    @order.save

    flash[:success] = t('orders.complete.success')
    redirect_to(:orders)
  end

  private
  def get_resource
    @order = current_restaurant.orders.find_by_id_and_complete(params[:id], false)
    redirect_to(:orders) if @order.nil?
  end
end