class CreateUserUnits < ActiveRecord::Migration
  def self.up
    create_table :user_units do |t|
      t.integer :parent_id
      t.integer :user_id
      t.integer :unit_id
      t.boolean :instructor
      t.decimal :grade
      t.decimal :percent_completed_if_student

      t.timestamps
    end
  end

  def self.down
    drop_table :user_units
  end
end
