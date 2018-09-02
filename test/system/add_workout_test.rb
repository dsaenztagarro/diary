# frozen_string_literal: true

require "application_system_test_case"
require_relative "../support/helpers/sessions_helper"
require_relative "../support/helpers/theme_helper"

class AddWorkoutTest < ApplicationSystemTestCase
  include SessionsHelper
  include ThemeHelper

  test "creating a workout" do
    login_user
    assert_panel_title "Add workout"

    fill_in "Duration", with: 90

    travel_to Time.zone.local(2018, 03, 07, 12, 30, 59) do
      click_on "Create"
    end

    assert_success_flash_message "The workout was created with success"

    assert_panel_title "Workouts"

    click_on "07/03/2018 12:30"

    # TODO: navigate to show page and validate content
    # TODO: Controller tests with error validations
  end
end
