class Card < ActiveRecord::Base

  has_many :card_views
  belongs_to :category
  
end
