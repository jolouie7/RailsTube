class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :destroy, :index]
  def index
    @users= User.all.order("created_at DESC")
  end

  def new
    @user= User.new
  end

  def create
    @user= User.new(user_params)
    password =
    # byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
    end
  end

  def user_posts
    # byebug
    @user = User.find(params[:id])
  end

    

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @user
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation , :age, :gender)
  end
end
