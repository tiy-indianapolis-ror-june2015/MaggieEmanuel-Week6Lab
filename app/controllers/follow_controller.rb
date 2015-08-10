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


    def follow
      @user = User.find(:id)
        if current_user == @user
          "You cannot follow yourself"
        else
          current_user.follow(@user)
          render "You are now following #{@user}"
        end
        redirect_to :back
    end

    def unfollow
      if current_user
        current_user.stop_following(@user)

          render "You are no longer following #{@user.email}."
        redirect_to :back
      else
        render "You must sign in to unfollow #{@user.email}."

      end
    end

end
