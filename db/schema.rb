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

ActiveRecord::Schema.define(version: 20170321184931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "physical_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["profile_id"], name: "index_addresses_on_profile_id", using: :btree
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authorizations_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "service_id"
    t.date     "day_booked"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "accepted",   default: false
    t.integer  "booker_id"
    t.integer  "bookee_id"
    t.index ["bookee_id"], name: "index_bookings_on_bookee_id", using: :btree
    t.index ["booker_id"], name: "index_bookings_on_booker_id", using: :btree
    t.index ["service_id"], name: "index_bookings_on_service_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.string   "category_pic"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "phyiscal_location"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["profile_id"], name: "index_locations_on_profile_id", using: :btree
  end

  create_table "mail_boxes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mail_boxes_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "mail_box_id"
    t.string   "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "read"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.integer  "service_id"
    t.index ["mail_box_id"], name: "index_messages_on_mail_box_id", using: :btree
    t.index ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
    t.index ["service_id"], name: "index_messages_on_service_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_phone_numbers_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subscription_id"
    t.string   "name_of_agency"
    t.text     "desc"
    t.string   "profile_picture"
    t.boolean  "paid"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "short_desc",      limit: 140
    t.string   "tagline",         limit: 26,  default: "Call We Serve"
    t.string   "banner"
    t.index ["subscription_id"], name: "index_profiles_on_subscription_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "star_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_ratings_on_service_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "user_id"
    t.string   "message"
    t.integer  "co_efficient"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["service_id"], name: "index_reviews_on_service_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "category_id"
    t.string   "picture"
    t.string   "desc_service"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name_of_service"
    t.integer  "price"
    t.string   "metric"
    t.index ["category_id"], name: "index_services_on_category_id", using: :btree
    t.index ["profile_id"], name: "index_services_on_profile_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "sub_cat_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.boolean  "recurring"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "number_of_uploads", default: 1
    t.boolean  "google_calendar",   default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           default: "info@eventicise.com", null: false
    t.string   "password_digest"
    t.integer  "kind"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name"
    t.integer  "profile_id"
    t.datetime "last_login_time"
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
  end

  add_foreign_key "bookings", "users", column: "bookee_id"
  add_foreign_key "bookings", "users", column: "booker_id"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
