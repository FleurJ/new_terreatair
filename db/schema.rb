# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_30_191534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "min_age"
    t.float "price"
    t.string "duration"
    t.string "links"
    t.string "language"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.text "teaser"
    t.bigint "activitytype_id"
    t.string "max_age"
    t.boolean "debate"
    t.integer "min_classes"
    t.integer "max_classes"
    t.index ["activitytype_id"], name: "index_activities_on_activitytype_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activities_tags", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_activities_tags_on_activity_id"
    t.index ["tag_id"], name: "index_activities_tags_on_tag_id"
  end

  create_table "activity_activitytypes", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "activitytype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_activity_activitytypes_on_activity_id"
    t.index ["activitytype_id"], name: "index_activity_activitytypes_on_activitytype_id"
  end

  create_table "activitytypes", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_activitytypes_on_user_id"
  end

  create_table "animator_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_animator_schedules_on_schedule_id"
    t.index ["user_id"], name: "index_animator_schedules_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.text "teaser"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "contents_tags", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_contents_tags_on_content_id"
    t.index ["tag_id"], name: "index_contents_tags_on_tag_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "price"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "product_type"
    t.float "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "schedule_date"
    t.integer "classes_qty"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "time"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "schedules_activities", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_schedules_activities_on_activity_id"
    t.index ["schedule_id"], name: "index_schedules_activities_on_schedule_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.string "production_date"
    t.string "operation"
    t.string "producer"
    t.text "comment"
    t.string "origin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.boolean "admin"
    t.string "phone"
    t.boolean "animator"
    t.boolean "editor"
    t.string "newsletters"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "activitytypes"
  add_foreign_key "activities", "users"
  add_foreign_key "activities_tags", "activities"
  add_foreign_key "activities_tags", "tags"
  add_foreign_key "activity_activitytypes", "activities"
  add_foreign_key "activity_activitytypes", "activitytypes"
  add_foreign_key "activitytypes", "users"
  add_foreign_key "animator_schedules", "schedules"
  add_foreign_key "animator_schedules", "users"
  add_foreign_key "contents", "users"
  add_foreign_key "contents_tags", "contents"
  add_foreign_key "contents_tags", "tags"
  add_foreign_key "memberships", "users"
  add_foreign_key "products", "users"
  add_foreign_key "schedules", "users"
  add_foreign_key "schedules_activities", "activities"
  add_foreign_key "schedules_activities", "schedules"
  add_foreign_key "stocks", "products"
  add_foreign_key "stocks", "users"
end
