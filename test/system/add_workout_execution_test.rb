# frozen_string_literal: true

require "application_system_test_case"
require_relative "../helpers/sessions_helper"

class AddWorkoutExecutionTest < ApplicationSystemTestCase
  include SessionsHelper

  test "visiting the index" do
    login_user
    assert_css ".panel-title", text: "Add workout execution"
  end
end
