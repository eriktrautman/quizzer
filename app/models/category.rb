class Category < ActiveRecord::Base

  has_many :cards, :dependent => :destroy
  has_many :quiz_categories, :dependent => :destroy
  has_many :user_category_queues, :dependent => :destroy

  validates :name, :presence => true

  def new_queue
    self.cards.shuffle
  end

end
