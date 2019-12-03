class SessionsController < ApplicationController
  skip_before_action :authorized, only[:new, :create, :destroy, :welcome]
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      flash[:notice] = "Logged In!"
      redirect_to "/welcome"
    else
      render "new"
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "You have successfully logged out."
    redirect_to "/welcome"
    # session[:user_id].delete
  end

  def login
  end

  def page_requires_login
  end
end
