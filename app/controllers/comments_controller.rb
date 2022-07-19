class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.author = Current.user
    post = Post.find(params[:post_id])
    @comment.post = post
    if @comment.save
      redirect_to user_post_path(post.author, post), notice: 'Comment added successfully.'
    else
      flash[:alert] = 'Something went wrong, comment not added!'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
