class PastOrdersController < ApplicationController
  before_filter :require_restaurant
  before_filter :get_resource, :only => [:show, :incomplete]

  layout 'control_panel'

  def index
    sort = 'updated_at DESC'
    @zone = ActiveSupport::TimeZone.new(current_restaurant.timezone)
    @orders = current_restaurant.orders.where(complete: true).
      page(params[:page]).order(sort)
  end

  def show
  end

  def incomplete
    @order.complete = false
    @order.save

    flash[:success] = t('past_orders.incomplete.success')
    redirect_to(:past_orders)
  end

  private
  def get_resource
    @order = current_restaurant.orders.find_by_id_and_complete(params[:id], true)
    redirect_to(:past_orders) if @order.nil?
  end
end