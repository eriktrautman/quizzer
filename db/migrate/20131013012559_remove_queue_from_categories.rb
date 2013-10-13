class RemoveQueueFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :queue
  end

  def down
    add_column :categories, :queue, :text
  end
end
