# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140925202704) do

  create_table "conteudos", force: true do |t|
    t.integer  "bimestre"
    t.string   "nome",       limit: 30
    t.string   "arquivo",    limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listas", force: true do |t|
    t.integer  "conteudo_id"
    t.string   "arquivo",     limit: 36
    t.string   "nome",        limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listas", ["conteudo_id"], name: "index_listas_on_conteudo_id"

  create_table "perguntas", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "conteudo_id"
    t.integer  "lista_id"
    t.text     "texto"
    t.datetime "horario"
    t.integer  "n_respostas"
    t.string   "respondida",  limit: 1
    t.string   "arquivo",     limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perguntas", ["conteudo_id"], name: "index_perguntas_on_conteudo_id"
  add_index "perguntas", ["lista_id"], name: "index_perguntas_on_lista_id"
  add_index "perguntas", ["usuario_id"], name: "index_perguntas_on_usuario_id"

  create_table "respostas", force: true do |t|
    t.integer  "pergunta_id"
    t.integer  "usuario_id"
    t.text     "texto"
    t.integer  "util_s"
    t.integer  "util_n"
    t.datetime "horario"
    t.string   "arquivo",     limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "respostas", ["pergunta_id"], name: "index_respostas_on_pergunta_id"
  add_index "respostas", ["usuario_id"], name: "index_respostas_on_usuario_id"

  create_table "tipos", force: true do |t|
    t.string   "nome",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.integer  "tipo_id"
    t.string   "username",   limit: 20
    t.string   "email",      limit: 30
    t.string   "senha",      limit: 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["tipo_id"], name: "index_usuarios_on_tipo_id"

end
