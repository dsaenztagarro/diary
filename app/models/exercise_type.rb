# frozen_string_literal: true

class ExerciseType < ApplicationRecord
  belongs_to :metadata_group, optional: true
end
