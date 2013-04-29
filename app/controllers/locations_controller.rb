class LocationsController < ApplicationController
  before_filter :require_user
  before_filter :get_resource, :only => [:show, :edit, :update, :destroy]

  def index
    order = 'state ASC, city ASC, address ASC'
    @locations = current_user.locations.page(params[:page]).order(order)
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.new(params[:location])
    if @location.save
      flash[:success] = t('locations.create.success')
      redirect_to(locations_url)
    else
      render(action: :new)
    end
  end

  def show
  end

  def edit
  end

  def update
    params[:location] ||= { item_ids: [] }
    params[:location][:item_ids] ||= []
    if @location.update_attributes(params[:location])
      flash[:success] = t('locations.update.success')
      redirect_to :locations
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    flash[:success] = t('locations.destroy.success')
    redirect_to(locations_url)
  end

  private
  def get_resource
    @location = current_user.locations.find_by_id(params[:id])
    redirect_to(:locations) if @location.nil?
  end
end