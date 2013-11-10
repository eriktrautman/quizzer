class RenameUserCategoryQueue < ActiveRecord::Migration
  def change
    rename_table :user_category_queues, :user_quiz_queues
    rename_column :user_quiz_queues, :category_id, :quiz_id
  end
end
