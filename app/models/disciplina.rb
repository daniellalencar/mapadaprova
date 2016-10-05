class Disciplina < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome_disciplina, :use => [:slugged, :finders]
  has_many :assuntos
  has_many :questaos
  scope :by_name, -> (name) { where("nome_disciplina like ?", "#{name}%")}


  def self.questoes_resolvidas_por_disciplina(disciplina_id, user_id)
    #debugger
   # banca =  Banca.find(banca_id)
    return Disciplina.joins(:assuntos => [:questaos => :usuario_questaos] ).select("disciplinas.*").where("usuario_questaos.user_id = ? and disciplinas.iddisciplina = ?", user_id, disciplina_id).group("disciplinas.iddisciplina")
  end

  def  disciplina_qtde_disciplina
    inst = clone
    return inst.nome_disciplina + " - " +inst.qtde_disciplina.to_s+" questões"
  end

  def self.resolvidas_por_disciplina( user_id)
    #debugger
    #return Banca.joins(:questaos => :usuario_questaos).where("usuario_questaos.user_id= ?",user_id)
    return Disciplina.joins(:assuntos => [:questaos => :usuario_questaos] ).select("disciplinas.*,count(distinct questaos.idquestao)").where("usuario_questaos.user_id= ?",user_id).group("disciplinas.iddisciplina")
  end

  def qtdeAcerto( user_id,bancasRel)
    #debugger
    relation = clone
    retorno = bancasRel.where("usuario_questaos.acertou" => true,"disciplinas.iddisciplina" => relation.id).select("count(distinct questaos.idquestao) as cont_acert").take
    return retorno
  end

  def qtdeErro( user_id,bancasRel)
   # debugger
    relation = clone
    retorno = bancasRel.where("usuario_questaos.acertou" => false,"disciplinas.iddisciplina" => relation.id).select("count(distinct questaos.idquestao) as cont_err").take
    return retorno
  end

end