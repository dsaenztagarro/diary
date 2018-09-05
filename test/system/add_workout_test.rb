# frozen_string_literal: true

require "application_system_test_case"
require_relative "../support/sessions_helper"
require_relative "../support/theme_helper"

class AddWorkoutTest < ApplicationSystemTestCase
  include SessionsHelper
  include ThemeHelper

  test "adding a workout" do
    login_user
    click_on "New workout"

    assert_panel_title "New workout"

    within "#exercise_1" do
      assert_content "The plank"
      fill_in "Duration", with: 20
    end
    within("#exercise_2") do
      assert_content "Side plank"
      fill_in "Duration", with: 30
    end
    travel_to Time.zone.local(2018, 03, 07, 12, 30, 59) do
      click_on "Add workout"
    end

    assert_success_flash_message "The workout was created with success"
    assert_panel_title "Workouts"

    click_on "07/03/2018 12:30"

    assert_panel_title "Workout"
    within("#exercise_0") do
      assert_content "Lumbar spine movement"
    end
    within("#exercise_1") do
      assert_content "The plank"
      assert_field "Duration", with: "20"
    end
    within("#exercise_2") do
      assert_content "Side plank"
      assert_field "Duration", with: "30"
    end

    # TODO: move to test "canceling changes"
    click_on "cancel"

    assert_panel_title "Workouts"
  end

  test "updating a workout" do
    login_user
    click_on "Search workout"
    click_link "15/02/2018 21:45"

    assert_panel_title "Workout"

    within("#exercise_0") do
      assert_content "Lumbar spine movement"
    end
    within("#exercise_1") do
      assert_content "The plank"
      assert_field("Duration", with: "60")
      fill_in "Duration", with: 70
    end
    within("#exercise_2") do
      assert_content "Side plank"
      assert_field("Duration", with: "90")
      fill_in "Duration", with: 105
    end
    travel_to Time.zone.local(2018, 03, 07, 12, 30, 59) do
      click_on "Update workout"
    end

    assert_panel_title "Workouts"
    click_link "15/02/2018 21:45"

    assert_panel_title "Workout"
    within("#exercise_0") do
      assert_content "Lumbar spine movement"
    end
    within("#exercise_1") do
      assert_content "The plank"
      assert_field("Duration", with: "70")
    end
    within("#exercise_2") do
      assert_content "Side plank"
      assert_field("Duration", with: "105")
    end
  end

  # TODO: Controller tests with error validations
end
