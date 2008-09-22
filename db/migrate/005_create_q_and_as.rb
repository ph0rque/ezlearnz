class CreateQAndAs < ActiveRecord::Migration
  def self.up
    create_table :q_and_as do |t|
      t.integer :part_id
      t.integer :position
      t.integer :score
      t.text :question
      t.text :answer
      t.text :explanation

      t.timestamps
    end
  end

  def self.down
    drop_table :q_and_as
  end
end
