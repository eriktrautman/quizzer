class User < ActiveRecord::Base

  has_many :card_views
  has_many :viewed_cards, :through => :card_views, :source => :card
  has_many :quizzes
  has_many :user_quiz_queues



  # for a given user and category, add any unused cards to the queue
  def rebuild_category_queue(category_id)
    category = Category.find(category_id)
    puts "\n\nRebuilding Category Queue for category: #{category.name}!"
    ucq = self.user_category_queues.where(:category_id => category_id).first
    puts "Old queue was #{ucq.queue.to_a}!"
    full_list = category.cards.to_a.map(&:id)
    puts "full list of card ids is #{full_list}!"
    # mash in all new cards but preserve order as much as possible
    # also ensure that any bogus cards that snuck in get weeded out
    # because apparently that's a problem somehow
    q = ucq.queue.to_a&full_list|full_list
    puts "q is now #{q}!"
    ucq.update_attributes!(:queue => q)
    puts "New queue is #{ucq.queue}!\n\n"
  end


end
