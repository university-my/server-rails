# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_16_121804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "reader", null: false
    t.integer "university_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["university_id"], name: "index_admin_users_on_university_id"
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "auditoriums", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.bigint "building_id"
    t.string "lowercase_name"
    t.boolean "is_hidden", default: false
    t.string "uuid", default: ""
    t.index ["building_id"], name: "index_auditoriums_on_building_id"
    t.index ["slug"], name: "index_auditoriums_on_slug"
    t.index ["slug_en"], name: "index_auditoriums_on_slug_en"
    t.index ["slug_uk"], name: "index_auditoriums_on_slug_uk"
    t.index ["university_id"], name: "index_auditoriums_on_university_id"
    t.index ["uuid"], name: "index_auditoriums_on_uuid"
  end

  create_table "auditoriums_disciplines", id: false, force: :cascade do |t|
    t.bigint "auditorium_id"
    t.bigint "discipline_id"
    t.index ["auditorium_id"], name: "index_auditoriums_disciplines_on_auditorium_id"
    t.index ["discipline_id"], name: "index_auditoriums_disciplines_on_discipline_id"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "server_id"
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_buildings_on_slug"
    t.index ["slug_en"], name: "index_buildings_on_slug_en"
    t.index ["slug_uk"], name: "index_buildings_on_slug_uk"
    t.index ["university_id"], name: "index_buildings_on_university_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_departments_on_slug"
    t.index ["slug_en"], name: "index_departments_on_slug_en"
    t.index ["slug_uk"], name: "index_departments_on_slug_uk"
    t.index ["university_id"], name: "index_departments_on_university_id"
  end

  create_table "discipline_name_suggestions", force: :cascade do |t|
    t.string "name"
    t.bigint "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_discipline_name_suggestions_on_discipline_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "university_id"
    t.string "visible_name", default: ""
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_disciplines_on_slug"
    t.index ["slug_en"], name: "index_disciplines_on_slug_en"
    t.index ["slug_uk"], name: "index_disciplines_on_slug_uk"
    t.index ["university_id"], name: "index_disciplines_on_university_id"
  end

  create_table "disciplines_groups", id: false, force: :cascade do |t|
    t.bigint "discipline_id"
    t.bigint "group_id"
    t.index ["discipline_id"], name: "index_disciplines_groups_on_discipline_id"
    t.index ["group_id"], name: "index_disciplines_groups_on_group_id"
  end

  create_table "disciplines_teachers", id: false, force: :cascade do |t|
    t.bigint "discipline_id"
    t.bigint "teacher_id"
    t.index ["discipline_id"], name: "index_disciplines_teachers_on_discipline_id"
    t.index ["teacher_id"], name: "index_disciplines_teachers_on_teacher_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_faculties_on_slug"
    t.index ["slug_en"], name: "index_faculties_on_slug_en"
    t.index ["slug_uk"], name: "index_faculties_on_slug_uk"
    t.index ["university_id"], name: "index_faculties_on_university_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.string "lowercase_name"
    t.bigint "faculty_id"
    t.bigint "speciality_id"
    t.integer "course"
    t.integer "stream"
    t.boolean "is_hidden", default: false
    t.string "uuid", default: ""
    t.index ["faculty_id"], name: "index_groups_on_faculty_id"
    t.index ["slug"], name: "index_groups_on_slug"
    t.index ["slug_en"], name: "index_groups_on_slug_en"
    t.index ["slug_uk"], name: "index_groups_on_slug_uk"
    t.index ["speciality_id"], name: "index_groups_on_speciality_id"
    t.index ["university_id"], name: "index_groups_on_university_id"
    t.index ["uuid"], name: "index_groups_on_uuid"
  end

  create_table "groups_lessons", id: false, force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "lesson_id"
    t.index ["group_id"], name: "index_groups_lessons_on_group_id"
    t.index ["lesson_id"], name: "index_groups_lessons_on_lesson_id"
  end

  create_table "groups_records", id: false, force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "record_id"
    t.index ["group_id"], name: "index_groups_records_on_group_id"
    t.index ["record_id"], name: "index_groups_records_on_record_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "pair_start_date"
    t.string "name"
    t.string "pair_name"
    t.string "reason"
    t.string "kind"
    t.string "time"
    t.bigint "auditorium_id"
    t.bigint "teacher_id"
    t.bigint "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "university_id"
    t.index ["auditorium_id"], name: "index_lessons_on_auditorium_id"
    t.index ["discipline_id"], name: "index_lessons_on_discipline_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
    t.index ["university_id"], name: "index_lessons_on_university_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.string "pair_name"
    t.string "reason"
    t.string "kind"
    t.string "time"
    t.bigint "auditorium_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "university_id"
    t.datetime "pair_start_date"
    t.bigint "discipline_id"
    t.index ["auditorium_id"], name: "index_records_on_auditorium_id"
    t.index ["discipline_id"], name: "index_records_on_discipline_id"
    t.index ["teacher_id"], name: "index_records_on_teacher_id"
    t.index ["university_id"], name: "index_records_on_university_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_specialities_on_slug"
    t.index ["slug_en"], name: "index_specialities_on_slug_en"
    t.index ["slug_uk"], name: "index_specialities_on_slug_uk"
    t.index ["university_id"], name: "index_specialities_on_university_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.string "lowercase_name"
    t.bigint "department_id"
    t.boolean "is_hidden", default: false
    t.string "uuid", default: ""
    t.index ["department_id"], name: "index_teachers_on_department_id"
    t.index ["slug"], name: "index_teachers_on_slug"
    t.index ["slug_en"], name: "index_teachers_on_slug_en"
    t.index ["slug_uk"], name: "index_teachers_on_slug_uk"
    t.index ["university_id"], name: "index_teachers_on_university_id"
    t.index ["uuid"], name: "index_teachers_on_uuid"
  end

  create_table "universities", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_hidden", default: false
    t.boolean "is_beta", default: false
    t.string "website", default: ""
    t.integer "uid", default: 0
    t.text "description", default: ""
    t.string "picture_white", default: ""
    t.string "picture_dark", default: ""
    t.boolean "show_classrooms", default: true
    t.boolean "show_groups", default: true
    t.boolean "show_teachers", default: true
    t.boolean "show_disciplines", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "auditoriums", "buildings"
  add_foreign_key "groups", "faculties"
  add_foreign_key "groups", "specialities"
  add_foreign_key "lessons", "universities"
  add_foreign_key "records", "disciplines"
  add_foreign_key "records", "universities"
  add_foreign_key "teachers", "departments"
end
