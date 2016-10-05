class Assunto  < ActiveRecord::Base
  extend FriendlyId
  friendly_id :assunto, :use => [:slugged, :finders]
  has_many :questao_assuntos
  has_many :questaos, through: :questao_assuntos
  belongs_to :disciplina
  has_many :assuntos, :class_name => 'Assunto', :foreign_key => 'assunto_id'

  def assuntosFilhos
    relation = clone
    return Assunto.where("assunto_id = ?", relation.id)
  end
  def assuntosPai
    relation = clone
    return Assunto.where("assunto_id is null")
  end

  def  assunto_qtde_questao
    #debugger
    inst = clone
    if(inst!=nil && inst.qtde_questao!=nil && inst!= "" )
      if(inst.assunto.to_s=="Lei nº 8.112-1990 - Regime jurídico dos servidores públicos federais")
        #debugger
      end
      puts inst.assunto
      a = inst.qtde_questao
      puts a
      return inst.assunto + " (" +inst.qtde_questao.to_s+")"
    else
        return inst.assunto + " (0)"
    end
  end

  def self.questoes_resolvidas_por_disciplina(assunto_id, user_id)
    #debugger
   # banca =  Banca.find(banca_id)
    return Assunto.joins(:questaos => :usuario_questaos).select("assuntos.*").where("usuario_questaos.user_id = ? and assuntos.idassunto = ?", user_id, assunto_id).group("assuntos.idassunto")
  end

  def self.resolvidas_por_disciplina( user_id)
    #debugger
    #return Banca.joins(:questaos => :usuario_questaos).where("usuario_questaos.user_id= ?",user_id)
    return Assunto.joins(:questaos => :usuario_questaos).select("assuntos.*").where("usuario_questaos.user_id= ?",user_id).group("assuntos.idassunto")
  end

  def qtdeAcerto( user_id,assuntoRel)
    #debugger
    relation = clone
    retorno = assuntoRel.where("usuario_questaos.acertou" => true,"assuntos.idassunto" => relation.id).select("count(distinct questaos.idquestao) as cont_acert").take
    return retorno
  end

  def qtdeErro( user_id,assuntoRel)
   # debugger
    relation = clone
    retorno = assuntoRel.where("usuario_questaos.acertou" => false,"assuntos.idassunto" => relation.id).select("count(distinct questaos.idquestao) as cont_err").take
    return retorno
  end

end