class CreateQuizCategories < ActiveRecord::Migration
  def change
    create_table :quiz_categories do |t|
      t.int :quiz_id
      t.int :category_id

      t.timestamps
    end
    add_index :quiz_categories, :quiz_id
    add_index :quiz_categories, :category_id
    add_index [:quiz_categories, :category_id], :unique => true
  end
end
