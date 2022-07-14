class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    @comment = Comment.create(comment_params)
    @comment.author = Current.user
    post = Post.find(params[:post_id])
    @comment.post = post
     if @comment.save
      flash[:notice] = 'Comment added successfully.'
      redirect_to user_post_path(post.author, post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def comment_params
     params.permit(:text)
  end
end