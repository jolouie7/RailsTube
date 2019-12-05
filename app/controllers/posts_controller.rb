class PostsController < ApplicationController
  def index
    @posts= Post.all.order("created_at DESC")
    # @user = User.find(params[:id])
  end

  def new
    @post= Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.user = current_user
    # byebug
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end


  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
      redirect_to @post
      else
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end


  private

  def post_params
    params.require(:post).permit(:name, :description, :user_id, :like)
    #Like was not included
  end
end
