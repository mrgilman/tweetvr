class SessionsController < ApplicationController
  def new
  end

  def create
    User.find_or_create_from_omniauth(env['omniauth.auth'])
    flash[:notice] = 'Successfully authenticated via Twitter'
    redirect_to root_path
  end
end
