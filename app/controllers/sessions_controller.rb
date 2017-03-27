class SessionsController < ApplicationController

  def new
    redirect_to guests_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to episodes_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

    def logged_in?
      !!session[:user_id]
    end

end
