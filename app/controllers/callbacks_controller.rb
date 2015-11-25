class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in @user
      redirect_to desks_path
    else
      redirect_to new_user_registration_path
    end
  end
end
