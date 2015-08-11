class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
protected
  # POST /resource
  def after_sign_up_path_for(resource)
<<<<<<< HEAD
    user_steps_path(:username)
=======
    user_step_path(:username)
>>>>>>> d2aa91adbf26842cc2db0e1a068d2a26122f9a72
  end


  # def after_update_path_for(resource)
  #   user_steps_path
  # end
end
