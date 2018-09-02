# frozen_string_literal: true

class MetadataGroup < ApplicationRecord
  has_many :metadata_keys
end
