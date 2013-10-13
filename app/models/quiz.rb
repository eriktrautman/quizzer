class Quiz < ActiveRecord::Base

  belongs_to :user
  has_many :quiz_categories
  has_many :categories, :through => :quiz_categories
  has_many :cards, :through => :categories 

  validates :user, :presence => true
  validates :name, :presence => true
  validates :quiz_categories, :presence => true

end
