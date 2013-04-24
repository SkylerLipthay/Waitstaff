class LocationsController < ApplicationController
  before_filter :require_user

  def index
    order = 'state ASC, city ASC, address ASC'
    @locations = Location.page(params[:page]).order(order)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = t('locations.create.success')
      redirect_back_or_default(locations_url)
    else
      render(action: :new)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end