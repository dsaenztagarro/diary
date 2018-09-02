# frozen_string_literal: true

class Metadatum < ApplicationRecord
  belongs_to :metadata_key
  belongs_to :workout_exercise
  delegate :name, to: :metadata_key
end
