class CreateUserParts < ActiveRecord::Migration
  def self.up
    create_table :user_parts do |t|
      t.integer :part_id
      t.integer :user_unit_id
      t.integer :user_id
      t.boolean :instructor
      t.integer :grade
      t.boolean :completed_if_student
      t.text :submission_or_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :user_parts
  end
end
