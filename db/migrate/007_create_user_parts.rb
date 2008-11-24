class CreateUserParts < ActiveRecord::Migration
  def self.up
    create_table :user_parts do |t|
      t.integer :part_id, :user_id, :user_unit_id, :grade
      t.boolean :completed
      t.text :submission_or_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :user_parts
  end
end
