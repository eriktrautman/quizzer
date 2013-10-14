class UserCategoryQueue < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates :user, :presence => true
  validates :category, :presence => true

  # Let Rails handle making our queue array into a serialized
  # form for saving and then deserializing it when I access it
  serialize :queue, Array
  
end
