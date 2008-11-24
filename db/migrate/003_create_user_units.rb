class CreateUserUnits < ActiveRecord::Migration
  def self.up
    create_table :user_units do |t|
      t.integer :parent_id, :user_id, :unit_id
      t.decimal :grade, :percent_completed

      t.timestamps
    end
  end

  def self.down
    drop_table :user_units
  end
end
