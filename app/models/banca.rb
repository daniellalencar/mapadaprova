class Banca < ActiveRecord::Base
  extend FriendlyId
  friendly_id :banca, :use => [:slugged, :finders]
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  has_many :questaos




  def self.questoes_resolvidas_por_banca(banca_id, user_id)
    #debugger
   # banca =  Banca.find(banca_id)
    return Banca.joins(:questaos => :usuario_questaos).where("usuario_questaos.user_id = ? and bancas.idbanca = ?",user_id,banca_id).
      group("bancas.idbanca").select("bancas.*,count(questaos.idquestao) as qtde_questoes, count(usuario_questaos.acertou) as qtde_acertou")
  end

  def self.resolvidas_por_banca( user_id)
    #debugger
    #return Banca.joins(:questaos => :usuario_questaos).where("usuario_questaos.user_id= ?",user_id)
    return Banca.joins(:questaos => :usuario_questaos).where("usuario_questaos.user_id= ?",user_id).
      group("bancas.idbanca").select("bancas.*, count(questaos.idquestao) as qtde_questoes")
  end

  def qtdeAcerto( user_id,bancasRel)
    relation = clone
    retorno = bancasRel.where("usuario_questaos.acertou" => true,"bancas.idbanca" => relation.id).select("count(questaos.idquestao) as cont_acert").take
    return retorno
  end

  def qtdeErro( user_id,bancasRel)
    relation = clone
    retorno = bancasRel.where("usuario_questaos.acertou" => false,"bancas.idbanca" => relation.id).select("count(questaos.idquestao) as cont_acert").take
    return retorno
  end
end