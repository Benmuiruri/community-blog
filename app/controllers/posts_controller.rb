class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @last_five_comments = @post.last_five_comments
  end

  def new
    @post = Post.new
  end

  def create
    post_content = params[:post]
    user = Current.user
    
    @post = Post.create(user, params[:post][:title], params[:post][:title])
     if @post.save
      flash[:notice] = 'New post created successfully.'
      redirect_to user_post_url(user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
