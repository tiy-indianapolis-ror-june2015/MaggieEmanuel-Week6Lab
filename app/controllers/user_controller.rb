class UserController < ApplicationController
  #  attr_accessible :email, :username, :user_bio, :user_photo

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
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
      if current_user == @user
        render "You cannot follow yourself"
      else
        current_user.follow(@user)
        render "You are now following #{@user.username}"
      end
      redirect_to :back
  end

  def unfollow
  end






end
