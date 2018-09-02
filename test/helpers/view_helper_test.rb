# frozen_string_literal: true

class ViewHelperTest < ActionView::TestCase
  include BootstrapHelper

  test "#panel" do
    rendered = <<~HTML
      <!-- begin row -->
      <div class="row">
        <!-- begin panel -->
        <div class="panel panel-inverse w-100" data-sortable-id="form-stuff-1">
          <!-- begin panel-heading -->
          <div class="panel-heading">
            <div class="panel-heading-btn">
              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
            </div>
            <h4 class="panel-title">Panel title</h4>
          </div>
          <!-- end panel-heading -->
          <!-- begin panel-body -->
          <div class="panel-body">
            <panel-content/>
          </div>
          <!-- end panel-body -->
        </div>
        <!-- end panel -->
      </div>
    HTML

    assert_dom_equal rendered, panel("Panel title") { "<panel-content/>".html_safe }
  end
end
