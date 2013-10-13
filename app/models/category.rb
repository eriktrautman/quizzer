class Category < ActiveRecord::Base

  has_many :cards
  has_many :quiz_categories
  has_many :user_category_queues

end
