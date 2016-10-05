class Questao < ActiveRecord::Base

  has_many :alternativas_questaos, dependent: :destroy
  has_many :usuario_questaos
  has_many :comentarios
  has_many :questao_assuntos
  has_many :assuntos, through: :questao_assuntos
  belongs_to :instituicao
  belongs_to :ano
  belongs_to :banca
  belongs_to :prova

  def qtdeAlternativas
    relation = clone
    return relation.alternativas_questaos.size
  end

  def enunciadoSemAlternativas
    relation = clone
    if qtdeAlternativas == 1
     # debugger
      return relation.alternativas_questaos.first.enunciado
    else
      retorno = ""
      retorno = relation.enunciado.split("a)").first if(relation.enunciado !=nil)
      return retorno
    end
  end

  def self.by_assunto(assuntos)
    #relation = clone
    return Questao.joins(:questao_assuntos).where("assunto_id in (?)",assuntos)
  end

  def self.by_ano(assuntos)
    #relation = clone
    return Questao.where("ano_id in (?)",assuntos)
  end

  def self.by_banca(assuntos)
    #relation = clone
    return Questao.where("banca_id in (?)",assuntos)
  end

  def self.by_instituicao(assuntos)
    #relation = clone
    return Questao.where("instituicao_id in (?)",assuntos)
  end

  def self.by_instituicao(assuntos)
    #relation = clone
    return Questao.where("instituicao_id in (?)",assuntos)
  end

  def self.by_prova(assuntos)
    #relation = clone
    return Questao.where("prova_id in (?)",assuntos)
  end


  def self.disciplinas(disciplina_id)
     return Questao.joins(questao_assuntos: [:assunto]).where("assuntos.disciplina_id=?",disciplina_id)
  end
end
