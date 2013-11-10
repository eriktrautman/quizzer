class Card < ActiveRecord::Base

  has_many :card_views
  belongs_to :category

  validates :title, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true

  # update the stats: add a pass and reduce a prior fail if any
  def pass(user)
    cv = CardView.find_or_create(user, self)
    cv.pass_count += 1
    cv.urgency -= 1 if cv.urgency > 0
    cv.save!
  end

  # update the stats: add a fail and upgrade urgency
  def fail(user)    
    cv = CardView.find_or_create(user, self)
    cv.fail_count += 1
    cv.urgency += 1
    cv.save!
  end


end
