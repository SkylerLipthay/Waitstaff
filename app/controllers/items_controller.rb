class ItemsController < ApplicationController
  before_filter :require_user
  before_filter :get_parent
  before_filter :get_resource, :only => [:edit, :update, :destroy]

  def index
    @items = @category.items.page(params[:page]).order('name ASC')
  end

  def new
    @item = Item.new
  end

  def create
    params[:item][:user_id] = current_user.id
    @item = @category.items.new(params[:item])
    if @item.save
      flash[:success] = t('items.create.success')
      redirect_to(category_items_url(@category))
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    params[:item][:option_group_ids] ||= []
    if @item.update_attributes(params[:item])
      flash[:success] = t('items.update.success')
      redirect_to(category_items_url(@category))
    else
      render(:edit)
    end
  end

  def destroy
    @item.destroy
    flash[:success] = t('items.destroy.success')
    redirect_to(category_items_url(@category))
  end

  private
  def get_parent
    @category = current_user.categories.find_by_id(params[:category_id])
    redirect_to(:categories) if @category.nil?
  end

  def get_resource
    @item = @category.items.find_by_id(params[:id])
    redirect_to(:categories) if @item.nil?
  end
end