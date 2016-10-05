class UsuarioQuestao < ActiveRecord::Base
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  belongs_to :user
  belongs_to :questao
  
  
end
