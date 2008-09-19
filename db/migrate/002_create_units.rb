class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.integer :parent_id
      t.integer :position
      t.string :type
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
