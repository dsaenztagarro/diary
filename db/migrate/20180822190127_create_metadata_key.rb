class CreateMetadataKey < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata_keys do |t|
      t.string :name
      t.belongs_to :metadata_group, foreign_key: true
    end
  end
end
