class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.last_three_posts.includes(:author)
    respond_to do |format|
      format.html
      format.json { render json: @user}
    end
  end
end
