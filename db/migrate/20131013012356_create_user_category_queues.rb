class CreateUserCategoryQueues < ActiveRecord::Migration
  def change
    create_table :user_category_queues do |t|
      t.integer :category_id
      t.integer :user_id
      t.text :queue

      t.timestamps
    end

    add_index :user_category_queues, :category_id
    add_index :user_category_queues, :user_id
    add_index :user_category_queues, [:category_id, :user_id], :unique => true
  end
end
