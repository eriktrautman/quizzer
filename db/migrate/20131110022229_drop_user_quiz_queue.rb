class DropUserQuizQueue < ActiveRecord::Migration
  def change
    drop_table :user_quiz_queues
  end
end
