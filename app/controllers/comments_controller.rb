class CommentsController < ApplicationController
  # def index
  #  @comments = Comment.includes(:post).where(post: params[:post_id])
  # end
  def new
    @comment = Comment.new
  end

  def create
  #   @post = Post.create(post_params)
  #   @post.author = Current.user
  #    if @post.save
  #     flash[:notice] = 'New post created successfully.'
  #     redirect_to user_post_path(@post.author, @post)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
end