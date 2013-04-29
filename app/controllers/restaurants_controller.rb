class RestaurantsController < ApplicationController
  before_filter :require_restaurant

  layout 'control_panel'

  def show
  end
end