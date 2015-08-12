
class UserController < ApplicationController
  attr_accessor :email, :user_name, :user_bio, :user_photo

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def follow

    @user = User.find(params[:id])
      if current_user
        current_user == @user
        flash[:notice] = "You cannot follow yourself"
      else
        current_user.follow(@user)
        flash[:notice] = "You are now following"
      end
      redirect_to :posts
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following"
    redirect_to root_path
  end

end
