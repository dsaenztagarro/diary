# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    if user_signed_in?
      redirect_to exercises_path
    else
      render layout: false
    end
  end
end
