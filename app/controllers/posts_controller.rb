class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    author = current_user
    @post.author = author
    if @post.save
      redirect_to user_post_url(author, @post), notice: 'New post created successfully.'
    else
      flash[:alert] = 'Something went wrong, post not created'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.author), notice: "Successfully deleted the post #{@post.title}."
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
