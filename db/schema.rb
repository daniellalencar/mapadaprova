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

ActiveRecord::Schema.define(version: 20161004200019) do

  create_table "alternativas_questaos", primary_key: "idalternativas_questao", force: :cascade do |t|
    t.integer "questao_id"
    t.text    "enunciado"
  end

  create_table "anos", primary_key: "idano", force: :cascade do |t|
    t.string "ano", limit: 45
  end

  create_table "artigos", primary_key: "idartigo", force: :cascade do |t|
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assuntos", primary_key: "idassunto", force: :cascade do |t|
    t.string  "assunto",          limit: 300
    t.integer "disciplina_id"
    t.integer "assunto_id"
    t.integer "codigoassuntoqc"
    t.string  "enderecodocodigo"
    t.integer "ordem"
    t.string  "slug"
    t.string  "copiado"
    t.string  "isartigo"
    t.integer "qtde_questao"
  end

  add_index "assuntos", ["assunto_id"], name: "index_assuntos_on_assunto_id"
  add_index "assuntos", ["disciplina_id"], name: "fk_disciplina_idx"

  create_table "bancas", primary_key: "idbanca", force: :cascade do |t|
    t.string "banca", limit: 100
    t.string "slug"
  end

  create_table "comentario_curtidas", primary_key: "idcomentario_curtidas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comentario_id"
  end

  create_table "comentarios", primary_key: "idComentario", force: :cascade do |t|
    t.text    "comentario"
    t.integer "user_id"
    t.integer "questao_id"
    t.integer "qtdecurtidas"
    t.string  "usernameautor"
    t.string  "autor"
  end

  create_table "disciplinas", primary_key: "iddisciplina", force: :cascade do |t|
    t.string  "nome_disciplina"
    t.integer "qtdepagina"
    t.string  "statuscopiado",           limit: 2
    t.integer "pagina"
    t.integer "ordem"
    t.string  "qtdequestaocq",           limit: 45
    t.string  "copiado",                 limit: 40
    t.string  "endereco_pagina_assunto"
    t.string  "slug"
    t.integer "qtde_disciplina"
  end

  create_table "idinformatica", id: false, force: :cascade do |t|
    t.integer "idquestao", default: 0, null: false
  end

  create_table "instituicaos", primary_key: "idinstituicao", force: :cascade do |t|
    t.string "nomeinstituicao", limit: 100
    t.string "slug"
  end

  create_table "log_questao", primary_key: "idlog_questao", force: :cascade do |t|
    t.text    "log"
    t.integer "codigoquestao"
    t.string  "disciplina",    limit: 45
  end

  create_table "monologue_posts", force: :cascade do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "monologue_posts", ["url"], name: "index_monologue_posts_on_url", unique: true

  create_table "monologue_taggings", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "monologue_taggings", ["post_id"], name: "index_monologue_taggings_on_post_id"
  add_index "monologue_taggings", ["tag_id"], name: "index_monologue_taggings_on_tag_id"

  create_table "monologue_tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "monologue_tags", ["name"], name: "index_monologue_tags_on_name"

  create_table "monologue_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provas", primary_key: "idprova", force: :cascade do |t|
    t.string "prova", limit: 100
    t.string "slug"
  end

  create_table "questao_assuntos", primary_key: "id_questao_assunto", force: :cascade do |t|
    t.integer "questao_id", null: false
    t.integer "assunto_id", null: false
  end

  add_index "questao_assuntos", ["assunto_id"], name: "fk_table1_assunto1_idx"
  add_index "questao_assuntos", ["questao_id"], name: "fk_table1_questao_idx"

  create_table "questaos", primary_key: "idquestao", force: :cascade do |t|
    t.text     "enunciado"
    t.integer  "numeroquestaoqc",                null: false
    t.string   "banca",             limit: 100
    t.string   "ano",               limit: 45
    t.string   "orgao",             limit: 100
    t.string   "cargo",             limit: 100
    t.string   "prova",             limit: 100
    t.string   "gabarito",          limit: 45
    t.datetime "data_alteracao"
    t.integer  "cont_pagina"
    t.text     "texto_associado"
    t.binary   "imagem_questao"
    t.string   "enderecoimagem",    limit: 2000
    t.string   "codigoqccifrado",   limit: 45
    t.integer  "banca_id"
    t.integer  "ano_id"
    t.integer  "instituicao_id"
    t.integer  "prova_id"
    t.boolean  "ismultiplaescolha"
  end

  add_index "questaos", ["numeroquestaoqc"], name: "numeroquestaoqc_unique", unique: true

  create_table "resposta_usuarios", id: false, force: :cascade do |t|
    t.integer "idusuario",     null: false
    t.date    "data_resposta", null: false
    t.integer "qtderesposta"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "usuario_questaos", primary_key: "id_usuario_questao", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "questao_id"
    t.string   "alternativa_escolhida", limit: 10
    t.datetime "updated_at"
    t.boolean  "acertou"
    t.datetime "created_at"
  end

  create_table "usuarios", primary_key: "idusuario", force: :cascade do |t|
    t.string  "login",      limit: 45
    t.string  "senha",      limit: 45
    t.integer "isliberado"
  end

end
