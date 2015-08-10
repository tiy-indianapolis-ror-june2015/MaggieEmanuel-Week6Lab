
class UserController < ApplicationController
  attr_accessor :email, :username, :user_bio, :user_photo


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
  end

  def follow
    @user = User.find(user_params)
      if current_user == @user
      else
        current_user.follow(@user)
      end
      redirect_to :back
  end

  def unfollow
    if current_user

      current_user.stop_following(@user)

      redirect_to :back

    end
  end

end
