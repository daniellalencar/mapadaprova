class Instituicao < ActiveRecord::Base
   extend FriendlyId
  friendly_id :nomeinstituicao, :use => [:slugged, :finders]
  has_many :questaos
end