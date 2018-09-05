# frozen_string_literal: true

class CreateMetadataKey < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata_keys do |t|
      t.string :name
      t.belongs_to :metadata_group, null: false
    end
  end
end
