class PagesController < ApplicationController
  before_filter :require_no_user

  def index
    @title = t('pages.index.title')
  end
end
