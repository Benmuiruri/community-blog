class LikesController < ApplicationController
  def create
    # Like.create(post: first_post, author: first_user)
    @like = Like.create(likes_params)
    @like.author = Current.user
    @post = Post.find(params[:post_id])
    @like.post = @post

     if @like.save
      flash[:notice] = 'Successfully liked post.'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:notice] = 'Something went wrong, like not posted.'
      redirect_to user_post_path(@post.author, @post)
    end
  end

  def destroy
    
  end

  private
  def likes_params
    params.permit(:author_id, :id)
  end
end