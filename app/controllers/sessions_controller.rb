class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy, :welcome]
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    # user = user.try(:authenticate, params[:password])
    # byebug
    # had to comment out this line because i couldn't log in. Maybe because we commented out before_action :authorized??
    if user && user.authenticate(params[:password_digest])
      @user = user
      session[:user_id] = user.id
      flash[:notice] = "Logged In!"
      redirect_to @user
    else
      render :new
    end
#     user = User.find_by(name: params[:user][:username])
# ​
#     user = user.try(:authenticate, params[:user][:password])
# ​
#     return redirect_to(controller: 'sessions', action: 'new') unless user
# ​
#     session[:user_id] = user.id
# ​
#     @user = user
# ​
#     redirect_to @user
  end

  def destroy
    session.delete(:user_id)
    # session.delete(:current_user_id)
    # session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to "/"
    # session[:user_id].delete
  end

  def welcome
  end

  def login
  end

  def page_requires_login
  end
end
