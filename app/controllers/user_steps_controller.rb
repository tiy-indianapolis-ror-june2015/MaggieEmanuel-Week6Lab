class UserStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!

  steps :username, :user_photo, :user_bio

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    render_wizard @user 
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :user_bio, :email, :password, :user_photo)
  end

end
