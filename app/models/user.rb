class User < ActiveRecord::Base

  has_many :card_views
  has_many :quizzes

end
