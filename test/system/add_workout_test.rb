# frozen_string_literal: true

require "application_system_test_case"
require_relative "../helpers/sessions_helper"
require_relative "../helpers/theme_helper"

class AddWorkoutTest < ApplicationSystemTestCase
  include SessionsHelper
  include ThemeHelper

  test "creating a workout" do
    login_user
    assert_panel_title "Add workout"

    click_on "Create"

    assert_success_flash_message "The workout was created with success"
    assert_panel_title "Workouts"
  end
end
