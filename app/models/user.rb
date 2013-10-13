class User < ActiveRecord::Base

  has_many :card_views
  has_many :quizzes
  has_many :user_category_queues


  # create the user category queues if they don't already exist
  def create_category_queues(category_ids)
    scq = self.user_category_queues
    category_ids.each do |id|
      next if id.blank?
      cat = Category.find(id)
      unless scq.include?(cat)
        queue = cat.new_queue
        UserCategoryQueue.create(:user => self, :queue => queue)
      end
    end
  end

end
