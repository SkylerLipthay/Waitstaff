class CategoriesController < ApplicationController
  before_filter :require_user
  before_filter :get_resource, :only => [:edit, :update, :destroy]

  def index
    @categories = current_user.categories.page(params[:page]).order('name ASC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(params[:category])
    if @category.save
      flash[:success] = t('categories.create.success')
      redirect_to(categories_url)
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:success] = t('categories.update.success')
      redirect_to :categories
    else
      render(:edit)
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t('categories.destroy.success')
    redirect_to(categories_url)
  end

  private
  def get_resource
    @category = current_user.categories.find_by_id(params[:id])
    redirect_to(:categories) if @category.nil?
  end
end