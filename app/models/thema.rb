
class Thema < ActiveRecord::Base
  self.table_name = 'themas'
  
  has_many :unterthemen, foreign_key: :belong, class_name: "Thema"
  belongs_to :oberthema, foreign_key: :belong, class_name: "Thema"
  has_many :topics
end
