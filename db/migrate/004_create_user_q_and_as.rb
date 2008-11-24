class CreateUserQAndAs < ActiveRecord::Migration
  def self.up
    create_table :user_q_and_as do |t|
      t.integer  :user_q_and_a_set_id, :q_and_a_id, :user_id
      t.decimal  :grade
      t.text     :student_answer

      t.timestamps
    end
  end

  def self.down
    drop_table :user_q_and_as
  end
end
