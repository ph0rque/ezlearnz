class CreateQAndAs < ActiveRecord::Migration
  def self.up
    create_table :q_and_as do |t|
      t.integer  :part_id, :author_id, :position, :potential_score
      t.text     :question, :answer, :explanation

      t.timestamps
    end
  end

  def self.down
    drop_table :q_and_as
  end
end
