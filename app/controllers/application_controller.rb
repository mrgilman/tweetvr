class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  helper_method :current_user

  def current_user
    User.where(remember_token: session[:remember_token]).first
  end

  private

  def authorize
    unless current_user.present?
      redirect_to root_path
    end
  end
end
