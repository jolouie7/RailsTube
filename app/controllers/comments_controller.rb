class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy, :index]
  def index
    @comments= Comment.all
  end

  def new
  end

  def create
    @comment= Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render 'new'
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
      redirect_to @comment
      else
      render 'edit'
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comment_path(@comment.post)
  end


  private

  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end

end
