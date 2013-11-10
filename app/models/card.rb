class Card < ActiveRecord::Base

  has_many :card_views
  belongs_to :category

  validates :title, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true

  # Update the pass numbers
  def pass(user)
    # create a new view table for this card and user if this is our
    # first time seeing this card (e.g. it doesn't have that table)
    if self.card_views.where(:user => user).empty?
      self.card_views << CardView.create!(:user => user, :card => self)
    end
    
    # update the stats: add a pass and reduce a prior fail if any
    cv = self.card_views.where(:user => user).first
    cv.pass_count += 1
    cv.urgency -= 1 if cv.urgency > 0
    cv.save!
  end

  # Update fail numbers
  def fail(user)
    # create a new view table for this card and user if this is our
    # first time seeing this card (e.g. it doesn't have that table)
    if self.card_views.where(:user => user).empty?
      self.card_views << CardView.create!(:user => user, :card => self)
    end
    
    # update the stats: add a fail and upgrade urgency
    cv = self.card_views.where(:user => user).first
    cv.fail_count += 1
    cv.urgency += 1
    cv.save!
  end


end
