class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :queue

      t.timestamps
    end
    add_index :categories, :name
  end
end
