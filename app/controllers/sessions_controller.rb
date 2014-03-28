class SessionsController < ApplicationController
  skip_before_filter :authorize

  def create
    user = User.find_or_create_from_omniauth(env['omniauth.auth'])
    session[:remember_token] = user.remember_token
    flash[:notice] = 'Successfully authenticated via Twitter'
    redirect_to dashboard_path
  end
end
