class QuestaoAssunto < ActiveRecord::Base
  belongs_to :questao
  belongs_to :assunto
end