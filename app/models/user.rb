class User < ActiveRecord::Base

  has_many :card_views
  has_many :quizzes
  has_many :user_category_queues


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

end
