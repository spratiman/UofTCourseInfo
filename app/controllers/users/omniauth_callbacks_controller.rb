class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # the following method should be implemented in the model (eg. app/models/user/rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirected @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :sucess, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end
