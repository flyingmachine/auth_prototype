class SessionsController < ApplicationController
  def new
  end
  
  def create
    authenticate
    
    if logged_in?
      redirect_to sessions_path
    else
      redirect_to new_session_path
    end
    # Audit.create!(:auditable => current_user, :user => previous_user, :action => 'passwordless_login') if previous_user
  end
  
  def login_credentials
    unless @login_credentials
      @login_credentials = params.slice(:login_id, :password, :skip_password)
      @login_credentials[:login_id] ||= params[:email] # alumni uses "email"
    end
    @login_credentials
  end
end
