class DaysController < ApplicationController
  before_filter :require_user
  before_filter :get_parent
  before_filter :get_resource, :only => [:show, :edit, :update, :destroy]

  def index
    order = 'date DESC'
    @days = @location.days.page(params[:page]).order(order)
  end

  def new
    @day = Day.new
  end

  def create
    invalid_date = false
    begin
      params[:day][:date] = Date.new(params[:day]['date(1i)'].to_i,
        params[:day]['date(2i)'].to_i,
        params[:day]['date(3i)'].to_i)
    rescue
      invalid_date = true
    end

    params[:day].parse_time_select!(:open)
    params[:day].parse_time_select!(:close)

    @day = @location.days.new(params[:day])
    
    if invalid_date
      @day.errors.add(:date, t('days.date.invalid'))
      render(action: :new)
      return
    end

    if @day.save
      flash[:success] = t('days.create.success')
      redirect_to(location_days_url(@location))
    else
      render(action: :new)
    end
  end

  def show
  end

  def edit
  end

  def update
    invalid_date = false
    begin
      params[:day][:date] = Date.new(params[:day]['date(1i)'].to_i,
        params[:day]['date(2i)'].to_i,
        params[:day]['date(3i)'].to_i)
    rescue
      invalid_date = true
    end

    params[:day].parse_time_select!(:open)
    params[:day].parse_time_select!(:close)

    if invalid_date
      @day.errors.add(:date, t('days.date.invalid'))
      render(action: :edit)
      return
    end

    if @day.update_attributes(params[:day])
      flash[:success] = t('days.update.success')
      redirect_to(location_days_url(@location))
    else
      render :edit
    end
  end

  def destroy
    @day.destroy
    flash[:success] = t('days.destroy.success')
    redirect_to(location_days_url(@location))
  end

  private
  def get_parent
    @location = current_user.locations.find_by_id(params[:location_id])
    redirect_to(:locations) if @location.nil?
  end

  def get_resource
    @day = @location.days.find_by_id(params[:id])
    redirect_to(:locations) if @day.nil?
  end
end