# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
  
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end  


  def after_omniauth_failure_path_for(scope)
    super(scope)
  end


  




end
