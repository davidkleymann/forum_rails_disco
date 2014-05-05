
class Thema < ActiveRecord::Base
  self.table_name = 'themas'
  
  has_many :unterthemen, foreign_key: :belong, class_name: "Thema"
  belongs_to :oberthema, foreign_key: :belong, class_name: "Thema"
  has_many :topics

  def self.hauptindex
    where(belong: nil)
  end

  def self.unterthemen(thema_id)
    where(belong: thema_id)
  end

  def updatable_attributes
    attributes.slice(*%w(id title description belong))
  end
end
