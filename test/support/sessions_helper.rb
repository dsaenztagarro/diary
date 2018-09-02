# frozen_string_literal: true

module SessionsHelper
  def login_user
    visit signin_path
    fill_in :name, with: "dsaenz"
    fill_in :email, with: "dsaenz@test.com"
    click_button
  end
end
