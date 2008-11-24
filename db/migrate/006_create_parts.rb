class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string   :title, :part_type 
      t.text     :body_or_instructions, :lecture_media
      t.integer  :author_id, :unit_id, :position, :grading_weight

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
