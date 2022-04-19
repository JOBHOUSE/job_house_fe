class UsersController < ApplicationController
  before_action :authorized, except: [:authorize]

  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    user = UserFacade.retrieve_user(email)
    session[:access_token] = auth_hash[:credentials][:token]
    # sessions only store basic datatypes (not poro)
    # implement caching instead cache the response and set expiration(time based)
    # view specific caching?
    session[:user] = user
<<<<<<< HEAD
    # session[:email] = email
=======
    session[:email] = email

>>>>>>> ed4cb7f12d0e888a28a738791891d5e7a1bb6b64
    # Doesn't persist between controller actions
    # Rails.cache.write('user', user)
    redirect_to dashboard_path
  end

  def index
<<<<<<< HEAD
    @user = UserFacade.retrieve_user(session[:user]['email'])
=======
    @user = UserFacade.retrieve_user(session[:email])
>>>>>>> ed4cb7f12d0e888a28a738791891d5e7a1bb6b64
    # @user_email = session[:user].values[1]
    # @user_jobs = session[:user].values[2]
  end

  def logout
    session.destroy
    redirect_to root_path
  end
end
