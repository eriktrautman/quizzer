class AddQToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :queue, :text
  end
end
