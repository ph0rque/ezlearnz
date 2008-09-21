# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 7) do

  create_table "parts", :force => true do |t|
    t.string   "title"
    t.integer  "unit_id"
    t.text     "body_or_instructions"
    t.text     "lecture_media"
    t.integer  "position"
    t.integer  "grading_weight"
    t.string   "part_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "q_and_as", :force => true do |t|
    t.integer  "q_and_a_set_id"
    t.integer  "position"
    t.integer  "score"
    t.text     "question"
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "unit_type"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_parts", :force => true do |t|
    t.integer  "part_id"
    t.integer  "user_unit_id"
    t.boolean  "instructor"
    t.integer  "grade"
    t.boolean  "completed_if_student"
    t.text     "submission_or_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_q_and_as", :force => true do |t|
    t.integer  "user_q_and_a_set_id"
    t.integer  "q_and_a_id"
    t.boolean  "instructor"
    t.decimal  "grade"
    t.text     "student_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_units", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.integer  "unit_id"
    t.boolean  "instructor"
    t.decimal  "grade"
    t.decimal  "percent_completed_if_student"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
