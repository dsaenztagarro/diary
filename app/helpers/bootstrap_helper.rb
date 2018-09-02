# frozen_string_literal: true

# TODO: extract to wrap-bootstrap gem
module BootstrapHelper
  def panel(title, &block)
    render "shared/panel", title: title, &block
  end
end
