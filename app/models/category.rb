class Category < ActiveRecord::Base

  has_many :cards
  has_many :quiz_categories

end
