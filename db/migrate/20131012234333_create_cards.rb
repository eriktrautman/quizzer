class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :category_id
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :cards, :category_id
    add_index :cards, :title, :unique => true
  end
end
