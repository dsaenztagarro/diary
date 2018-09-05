# frozen_string_literal: true

class CreateMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata do |t|
      t.belongs_to :metadata_key, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.string :value
    end
  end
end
