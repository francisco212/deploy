class Lista < ActiveRecord::Base
  belongs_to :conteudo
  
  validates :nome,presence: true

validates :conteudo,presence: true

end
