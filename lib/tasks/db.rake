# frozen_string_literal: true

namespace :db do
  task go: [:environment, :drop, :create, :migrate, :seed]
end
