# frozen_string_literal: true

class CreateMetadataGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata_groups do |t|
      t.string :name
    end
  end
end
