class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user_session, :current_user,
    :current_restaurant_session, :current_restaurant

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_url, alert: exception.message)
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = t('application.require_user')
      redirect_to(new_user_session_url)
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to(account_url)
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def current_restaurant_session
    return @current_restaurant_session if defined?(@current_restaurant_session)
    @current_restaurant_session = LocationSession.find
  end

  def current_restaurant
    return @current_restaurant if defined?(@current_restaurant)
    @current_restaurant = current_restaurant_session && current_restaurant_session.record
  end

  def require_restaurant
    unless current_restaurant
      flash[:notice] = t('application.require_restaurant')
      redirect_to(control_panel_url)
      return false
    end
  end

  def require_no_restaurant
    if current_restaurant
      redirect_to(restaurant_url)
      return false
    end
  end
end
