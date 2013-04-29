class OptionsController < ApplicationController
  before_filter :require_user
  before_filter :get_parent
  before_filter :get_resource, :only => [:edit, :update, :destroy]

  def index
    @options = @option_group.options.page(params[:page]).order('name ASC')
  end

  def new
    @option = Option.new
  end

  def create
    @option = @option_group.options.new(params[:option])
    if @option.save
      flash[:success] = t('options.create.success')
      redirect_to(option_group_options_url(@option_group))
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    if @option.update_attributes(params[:option])
      flash[:success] = t('options.update.success')
      redirect_to(option_group_options_url(@option_group))
    else
      render(:edit)
    end
  end

  def destroy
    @option.destroy
    flash[:success] = t('options.destroy.success')
    redirect_to(option_group_options_url(@option_group))
  end

  private
  def get_parent
    group_id = params[:option_group_id]
    @option_group = current_user.option_groups.find_by_id(group_id)
    redirect_to(:option_groups) if @option_group.nil?
  end

  def get_resource
    @option = @option_group.options.find_by_id(params[:id])
    redirect_to(:option_groups) if @option.nil?
  end
end