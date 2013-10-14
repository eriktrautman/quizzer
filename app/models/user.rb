class User < ActiveRecord::Base

  has_many :card_views
  has_many :quizzes
  has_many :user_category_queues

  # This is necessary because when ActiveRecord tries to
  # deserialize the "queue" column of UserCategoryQueue,
  # it doesn't yet know what a "card" object is, and throws
  # an error.  For more info, see:
  # http://stackoverflow.com/questions/13750342/yamlload-raises-undefined-class-module-error
  require 'Card'


  # create the user category queues if they don't already exist
  def create_category_queues(category_ids)
    ucq = self.user_category_queues
    category_ids.each do |id|
      next if id.blank?
      cat = Category.find(id)
      unless ucq.include?(cat)
        queue = cat.new_queue
        new_ucq = UserCategoryQueue.create!(:user => self, :category => cat, :queue => queue)
      end
    end
  end

  # Update the pass numbers
  def pass_card(card)

    # create a new view table for this card and user if this is our
    # first time seeing this card (e.g. it doesn't have that table)
    if card.card_views.where(:user => self).empty?
      card.card_views << CardView.create!(:user => self, :card => card)
    end
    
    # update the stats: add a pass and reduce a prior fail if any
    cv = card.card_views.where(:user => self).first
    cv.pass_count += 1
    cv.urgency -= 1 if cv.urgency > 0
    cv.save!

    # shuffle the card back into the deck at a position based on
    # its urgency
    shuffle_pct = Card.get_shuffle_location(cv.urgency)
    ucq = UserCategoryQueue.where(:user => self, :category => card.category).first
    queue = ucq.queue
    new_pos = rand( queue.size * shuffle_pct )
    ucq.queue = queue.insert(new_pos, queue.delete_at(0))
    ucq.save!
  end

  def fail_card(card)
    # create a new view table for this card and user if this is our
    # first time seeing this card (e.g. it doesn't have that table)
    if card.card_views.where(:user => self).empty?
      card.card_views << CardView.create!(:user => self, :card => card)
    end
    
    # update the stats: add a fail and reduce a prior fail if any
    cv = card.card_views.where(:user => self).first
    cv.fail_count += 1
    cv.urgency += 1
    cv.save!

    # shuffle the card back into the deck at a position based on
    # its urgency
    shuffle_pct = Card.get_shuffle_location(cv.urgency)
    ucq = UserCategoryQueue.where(:user => self, :category => card.category).first
    queue = ucq.queue
    new_pos = rand( queue.size * shuffle_pct )
    ucq.queue = queue.insert(new_pos, queue.delete_at(0))
    ucq.save!
  end

end
