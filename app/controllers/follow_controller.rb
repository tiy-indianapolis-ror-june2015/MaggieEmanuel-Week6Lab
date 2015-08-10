class FollowController < ApplicationController


  def create
      user = User.find(params[:followed_id])
      current_user.follow(user)
      redirect_to user
  end

  def destroy
      user = Follow.find(params[:id]).followed_id
      currnet_user.unfollow(user)
      redirect_to user

  end

end
