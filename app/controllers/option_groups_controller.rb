class OptionGroupsController < ApplicationController
  before_filter :require_user
  before_filter :get_resource, :only => [:edit, :update, :destroy]

  def index
    @option_groups = current_user.option_groups.page(params[:page]).
      order('name ASC')
  end

  def new
    @option_group = OptionGroup.new
  end

  def create
    @option_group = current_user.option_groups.new(params[:option_group])
    if @option_group.save
      flash[:success] = t('option_groups.create.success')
      redirect_to(option_groups_url)
    else
      render(action: :new)
    end
  end

  def edit
  end

  def update
    if @option_group.update_attributes(params[:option_group])
      flash[:success] = t('option_groups.update.success')
      redirect_to :option_groups
    else
      render :edit
    end
  end

  def destroy
    @option_group.destroy
    flash[:success] = t('option_groups.destroy.success')
    redirect_to(option_groups_url)
  end

  private
  def get_resource
    @option_group = current_user.option_groups.find_by_id(params[:id])
    redirect_to(:option_groups) if @option_group.nil?
  end
end