class User < ActiveRecord::Base

  has_many :card_views
  has_many :quizzes
  has_many :user_category_queues

end
