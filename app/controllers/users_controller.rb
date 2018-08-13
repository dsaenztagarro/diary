# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    if user_signed_in?
      redirect_to after_sign_in_path
    else
      render layout: false
    end
  end

  private

    def after_sign_in_path
      new_workout_execution_path
    end
end
