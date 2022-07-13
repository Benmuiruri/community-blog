class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @last_five_comments = @post.last_five_comments
  end
end
