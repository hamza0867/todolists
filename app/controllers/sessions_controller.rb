class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: %i[new create]
  def new; end

  def create
    user = User.find_by(username: params[:user][:username])
    password = params[:user][:password]
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully as #{user.username}"
    else
      redirect_to login_path, alert: 'The username/passord combination is invalid'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end
