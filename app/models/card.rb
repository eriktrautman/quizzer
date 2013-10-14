class Card < ActiveRecord::Base

  has_many :card_views
  belongs_to :category

  validates :title, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true

  # returns the decimal representing the % of how close to the front
  # of the queue the card should be reshuffled into, e.g.
  # .3 means it should be randomly placed in the nearest 30%
  def self.get_shuffle_location(urgency)
    shuffle_location = 1.0 / (1.0+urgency)
    puts "\n\nSHUFFLE pct is : #{shuffle_location}\n\n"
    shuffle_location
  end
  
end
