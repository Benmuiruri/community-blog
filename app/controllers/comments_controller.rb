class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    post = Post.find(params[:post_id])
    render json: post.comments
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.author = current_user
    @post = Post.find(params[:post_id])
    @comment.post = @post

    return unless @comment.save

    respond_to do |format|
      format.html do
        flash[:notice] = 'You commented.'
        redirect_to user_post_url(current_user, @post)
      end
      format.json do
        render json: new_comment
      end
    end

    # if @comment.save
    #   redirect_to user_post_path(current_user, @post), notice: 'Comment added successfully.'
    # else
    #   flash[:alert] = 'Something went wrong, comment not added!'
    #   render :new, status: :unprocessable_entity
    # end
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
