class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end

  private
    def callback_from(provider)
      auth = env['omniauth.auth']
      unless auth
        return redirect_to new_user_session_path , :notice => I18n.t('flash.facebook_oauth_failure')
      end
      user = User.find_by(uid: auth.uid)
      if user.blank?
        user_params = {
          email: auth.info.email,
          name: auth.info.name,
          image: auth.info.image,
          uid: auth.uid
        }
        user = User.new(user_params)
        user.save(validate: false)
      end
      sign_in user
      return redirect_to mypage_path(user.id)
      #provider = provider.to_s
      #@user = User.find_for_oauth(request.env['omniauth.auth'])
      #if @user.persisted?
      #  cookies.permanent[:xxx_logined] = { value: @user.created_at }
      #  flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      #  sign_in_and_redirect "/mypage/profile", event: :authentication
      #else
      #  if provider == 'twitter'
      #    session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      #  else
      #    session["devise.facebook_data"] = request.env["omniauth.auth"]
      #  end
      #  redirect_to new_user_registration_url
      #end
    end
end
