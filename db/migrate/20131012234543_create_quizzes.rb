class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :quizzes, :user_id
    add_index :quizzes, :name, :unique => true
  end
end
