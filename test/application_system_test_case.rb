# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["HEADLESS_CHROME"]
    driven_by :selenium, using: :headless_chrome
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
