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

ActiveRecord::Schema.define(version: 2019_10_24_174313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_bancos_on_user_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dividendos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "pago", default: false
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "competencia"
    t.bigint "user_id"
    t.date "data_vencimento"
    t.bigint "categoria_id"
    t.index ["categoria_id"], name: "index_dividendos_on_categoria_id"
    t.index ["user_id"], name: "index_dividendos_on_user_id"
  end

  create_table "saldos", force: :cascade do |t|
    t.date "data"
    t.float "valor"
    t.bigint "banco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banco_id"], name: "index_saldos_on_banco_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome", default: "", null: false
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

  add_foreign_key "bancos", "users"
  add_foreign_key "dividendos", "categorias"
  add_foreign_key "dividendos", "users"
  add_foreign_key "saldos", "bancos"
end
