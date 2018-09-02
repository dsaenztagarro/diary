# frozen_string_literal: true

module ThemeHelper
  def assert_panel_title(text)
    assert_css ".panel-title", text: text
  end

  def assert_success_flash_message(text)
    assert_css ".alert.alert-success.fade.show", text: text
  end
end
