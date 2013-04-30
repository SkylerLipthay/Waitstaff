class LocationSessionsController < ApplicationController
  before_filter :require_no_restaurant, only: [:show, :create]
  before_filter :require_restaurant, only: :destroy

  layout 'control_panel'

  def show
    @location_session = LocationSession.new
  end

  def create
    @location_session = LocationSession.new(params[:location_session])
    if @location_session.save
      redirect_to(orders_url)
    else
      render(:show)
    end
  end

  def destroy
    current_restaurant_session.destroy
    redirect_to(root_url)
  end
end