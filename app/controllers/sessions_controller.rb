# frozen_string_literal: true

class SessionsController < ApplicationController
  if Rails.env.development?
    skip_before_action :verify_authenticity_token, only: :create
  end

  def new
    if Rails.env.production?
      redirect_to "/auth/github"
    else
      redirect_to "/auth/developer"
    end
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_with_omniauth(auth) || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to after_sign_in_path
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
