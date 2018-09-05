# frozen_string_literal: true

class Metadatum < ApplicationRecord
  belongs_to :metadata_key
  belongs_to :exercise
  delegate :name, to: :metadata_key
end
