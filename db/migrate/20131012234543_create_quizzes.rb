class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.int :user_id

      t.timestamps
    end
    add_index :quizzes, :user_id
  end
end
