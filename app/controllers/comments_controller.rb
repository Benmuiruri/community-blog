class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  # def index
  #   @post = Post.includes(:author, comments: [:author]).find(params[:id])
  # end

  def create
    @comment = Comment.create(comment_params)
    @comment.author = current_user
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(current_user, @post), notice: 'Comment added successfully.'
    else
      flash[:alert] = 'Something went wrong, comment not added!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post = @post
    @comment.destroy
    redirect_to user_post_path(current_user, params[:post_id]), notice: 'Successfully deleted the comment.'
  end

  private

  def comment_params
    params.permit(:text)
  end
end
