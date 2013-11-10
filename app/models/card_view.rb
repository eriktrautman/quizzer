class CardView < ActiveRecord::Base

  belongs_to :user
  belongs_to :card

  def self.find_or_create(user, card)
    cv = CardView.where(:user => user, :card => card).first
    if cv.nil?
      cv = CardView.create!(:user => user, :card => card)
    end
    cv
  end

  # returns the decimal representing the % of how close to the front
  # of the queue the card should be reshuffled into, e.g.
  # .3 means it should be placed in the nearest 30%
  def get_shuffle_location
    pass_rate = (1.0 * self.pass_count / ( self.pass_count + self.fail_count ))
    puts "\n\n Shuffle locationing, pass rate is: #{pass_rate}!!\n\n"

    shuffle_location = pass_rate / (1.0+self.urgency)
    puts "\n\nSHUFFLE pct is : #{shuffle_location}\n\n"
    shuffle_location
  end

end
