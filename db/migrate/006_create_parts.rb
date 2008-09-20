class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :title
      t.integer :unit_id
      t.text :body_or_instructions
      t.text :lecture_media
      t.integer :position
      t.integer :grading_weight
      t.string :part_type

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
