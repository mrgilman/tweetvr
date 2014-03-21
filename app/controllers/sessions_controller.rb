class SessionsController < ApplicationController
  def create
    User.find_or_create_from_omniauth(env['omniauth.auth'])
    flash[:notice] = 'Successfully authenticated via Twitter'
    redirect_to dashboard_path
  end
end
