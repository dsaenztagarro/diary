# frozen_string_literal: true

require "application_system_test_case"
require_relative "../helpers/sessions_helper"
require_relative "../helpers/theme_helper"

class AddWorkoutExecutionTest < ApplicationSystemTestCase
  include SessionsHelper
  include ThemeHelper

  test "creating a workout execution" do
    login_user
    assert_panel_title "Add workout execution"

    click_on "Create"

    assert_success_flash_message "The workout execution was created with success"
    assert_panel_title "Workout executions"
  end
end
