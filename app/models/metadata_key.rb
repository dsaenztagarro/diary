# frozen_string_literal: true

class MetadataKey < ApplicationRecord
  belongs_to :metadata_group
end
