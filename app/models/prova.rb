class Prova < ActiveRecord::Base
  extend FriendlyId
  friendly_id :prova, :use => [:slugged, :finders]
  has_many :questaos
end