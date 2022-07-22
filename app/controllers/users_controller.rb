class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.last_three_posts.includes(:author)
    respond_to do |format|
      format.html
      format.json { render json: @recent_posts}
    end
  end
end
