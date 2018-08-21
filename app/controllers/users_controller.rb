# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    if user_signed_in?
      redirect_to after_sign_in_path
    else
      render layout: false
    end
  end
end
