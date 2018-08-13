# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :exercise_type
  delegate :name, to: :exercise_type
end
