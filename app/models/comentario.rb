class Comentario  < ActiveRecord::Base
  belongs_to :questao
  belongs_to :user
end