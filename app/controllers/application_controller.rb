class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  def current_user
    User.find_by_remember_token session[:remember_token]
  end

  private

  def authorize
    unless current_user.present?
      redirect_to root_path
    end
  end
end
