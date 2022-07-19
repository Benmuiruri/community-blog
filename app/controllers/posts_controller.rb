class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.includes(:author, comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.author = Current.user
    if @post.save
      redirect_to user_post_path(@post.author, @post), 'New post created successfully.'
    else
      flash[:alert] = 'Something went wrong, post not created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
