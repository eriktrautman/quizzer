class Quiz < ActiveRecord::Base

  belongs_to :user
  has_many :quiz_categories, :dependent => :destroy
  has_many :categories, :through => :quiz_categories
  has_many :cards, :through => :categories 

  validates :user, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates :categories, :presence => true

    # This is necessary because when ActiveRecord tries to
  # deserialize the "queue" column of UserCategoryQueue,
  # it doesn't yet know what a "card" object is, and throws
  # an error.  For more info, see:
  # http://stackoverflow.com/questions/13750342/yamlload-raises-undefined-class-module-error

  require 'Card'

  # Generates the current card by randomly sampling
  # from among the available categories and grabbing
  # the top card of the queue
  def current_card
    cat = self.categories.sample
    ucq = UserCategoryQueue.where(:user => self.user, :category => cat).first
    ucq.queue.first
  end

end
