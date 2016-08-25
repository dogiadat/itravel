class Users::CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth request.env["omniauth.auth"]
    sign_in @user
    redirect_to root_path
  end

  def google_oauth2
    @user = User.from_omniauth request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = t ".success", kind: "Google"
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
