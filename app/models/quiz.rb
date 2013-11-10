class Quiz < ActiveRecord::Base

  belongs_to :user
  has_many :quiz_categories, :dependent => :destroy
  has_many :categories, :through => :quiz_categories
  has_many :cards, :through => :categories 

  validates :user, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates :categories, :presence => true

  # Let Rails handle making our queue array into a serialized
  # form for saving and then deserializing it when I access it
  serialize :queue, Array

  # create the user category queues if they don't already exist
  def create_queue
    self.queue = self.cards.map(&:id)
    self.save!
  end

  # Generates the current card by randomly sampling
  # from among the available categories and grabbing
  # the top card of the queue
  def current_card
    Card.find(self.queue.first)
  end

  def shuffle_card_into_queue(cv)
    # shuffle the card back into the deck at a position based on
    # its urgency
    shuffle_pct = cv.get_shuffle_location
    q = self.queue
    puts "\n\n OLD QUEEUE : #{q}!!"
    new_pos = q.size * shuffle_pct - 1
    self.queue = q.insert(new_pos, q.delete_at(0))
    puts "NEW QUEUE: #{q}!\n\n"
    self.save!

  end

  def shuffle_queue
    q = self.queue
    self.queue = q.shuffle
    self.save!
  end

end
