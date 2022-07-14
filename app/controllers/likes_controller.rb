class LikesController < ApplicationController
  def create
    @user = Current.user
    @post = Post.includes(:author).find(params[:post_id])

    @already_liked = Like.where(author: @user, post: @post)
    destroy && return if @already_liked.present?

    @like = Like.create(likes_params)
    @like.author = @user
    @like.post = @post

     if @like.save
      flash[:notice] = 'Successfully liked post.'
      redirect_back_or_to user_post_path(@post.author, @post)
    else
      flash[:notice] = 'Something went wrong, like not posted.'
     redirect_back_or_to user_post_path(@post.author, @post)
    end
  end

  def destroy
    @like = Current.user.likes.last
    @like.destroy
    @post = @like.post
    flash[:notice] = 'You unliked this post.'
    redirect_back_or_to user_post_path(@post.author, @post)
  end

  private
  def likes_params
    params.permit(:author_id, :id)
  end
end